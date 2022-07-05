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
  //final databaseRef = FirebaseDatabase.instance.reference();

  // ignore: override_on_non_overriding_member
  final postTextController = TextEditingController();
  final inviteTextController = TextEditingController(text: '''Mode : 
  Rank : 
  Link Room : ''');

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

  void _sendInvite() {
    final message = Message(inviteTextController.text, modelProfile!.username);
    messageDao.saveMessage(message);
    postTextController.clear();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(23, 26, 33, 1),
        appBar: AppBar(
          title: Text("GilTzy"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                SizedBox(
                  width: 800,
                  height: 400,
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
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Make Team",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 500,
                              child: TextField(
                                controller: inviteTextController,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 104, 104, 104),
                                  onPrimary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  _sendInvite();
                                },
                                child: Text(
                                  "Send",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    );
                  });
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: TextField(
                    controller: postTextController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    textAlign: TextAlign.left,
                  ),
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
        ),
      ),
    );
  }
}
