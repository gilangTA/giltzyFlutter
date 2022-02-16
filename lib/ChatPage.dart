import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/ModelProfile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class Message {
  final String text;
  final String username;

  Message(
    this.text,
    this.username,
  );
  Message.fromJson(Map<dynamic, dynamic> json)
      : text = json['text'] as String,
        username = json['username'] as String;
  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'text': text,
        'username': username,
      };
}

class MessageDao {
  final DatabaseReference _messagesRef =
      // ignore: deprecated_member_use
      FirebaseDatabase.instance.reference().child('messages');
  void saveMessage(Message message) {
    _messagesRef.push().set(message.toJson());
  }

  Query getMessageQuery() {
    return _messagesRef;
  }
}

class _ChatPageState extends State<ChatPage> {
  @override
  // ignore: deprecated_member_use
  final databaseRef = FirebaseDatabase.instance.reference();

  final postTextController = TextEditingController();
  final messageDao = MessageDao();
  ModelProfile? modelProfile;

  void initState() {
    ModelProfile.getApiProfile().then((value) {
      modelProfile = value;
      setState(() {});
    });
    super.initState();
  }

  void _sendMessage() {
    final message = Message(postTextController.text, modelProfile!.username);
    messageDao.saveMessage(message);
    postTextController.clear();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("GilTzy"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, top: 30, right: 50),
            child: Column(
              children: [
                SizedBox(
                  width: 800,
                  height: 500,
                  child: FirebaseAnimatedList(
                    query: messageDao.getMessageQuery(),
                    itemBuilder: (context, snapshot, animation, index) {
                      final json = snapshot.value as Map<dynamic, dynamic>;
                      final message = Message.fromJson(json);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              message.username,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Text(
                            message.text,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: postTextController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: 50,
                      child: IconButton(
                        icon: Icon(
                          Icons.send,
                          size: 40,
                        ),
                        color: Colors.white,
                        onPressed: () {
                          _sendMessage();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
