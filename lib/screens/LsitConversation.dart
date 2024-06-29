import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/listchat.dart';
import '../widgets/my_flutter_app_icons.dart';

class ChatScreen extends StatefulWidget {
  final String text;
  final bool isSentByMe;
  final String userName;
  final String time;

  const ChatScreen({
    required this.text,
    required this.isSentByMe,
    required this.userName,
    required this.time,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeff3fe),
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.only(top: 25),
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Color(0xff5a55cd),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xffeff3fe),
                          ),
                        ),
                        const Text(
                          "Chats",
                          style: TextStyle(
                            color: Color(0xffeff3fe),
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Color(0xffeff3fe),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 120,
                bottom: 0,
                left: 0,
                right: 0,
                child: Material(
                  elevation: 5,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15, left: 5, right: 5),
                    padding: EdgeInsets.only(top: 2, left: 20, right: 20, bottom: 2),
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Color(0xffeff3fe),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: Listmessages.length,
                            itemBuilder: (context, index) {
                              final message = Listmessages[index];
                              final name = message["name"];
                              final time = message["time"];
                              final chat = message["chat"];
                              //final imagepath = message["image"];
                              final isSentByMe = message["isMe"];
                              return Align(
                                alignment: isSentByMe
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: isSentByMe
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    if (!isSentByMe) ...[
                                      const Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage:
                                            AssetImage(""),
                                            radius: 20.0,
                                          ),
                                          SizedBox(width: 10.0),
                                        ],
                                      ),
                                    ],
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: isSentByMe ? 0 : 35,
                                      ),
                                      padding: EdgeInsets.all(12.0),
                                      constraints:
                                      BoxConstraints(maxWidth: 250),
                                      decoration: BoxDecoration(
                                        color: isSentByMe
                                            ? Colors.purple
                                            : Colors.grey[300],
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                          topLeft: isSentByMe
                                              ? Radius.circular(30.0)
                                              : Radius.circular(1.0),
                                          bottomRight: isSentByMe
                                              ? Radius.circular(1.0)
                                              : Radius.circular(30.0),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: isSentByMe
                                            ? CrossAxisAlignment.end
                                            : CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            chat,
                                            style: TextStyle(
                                              color: isSentByMe
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 5.0),
                                          Text(
                                            time,
                                            style: TextStyle(
                                              color: isSentByMe
                                                  ? Colors.white70
                                                  : Colors.black54,
                                              fontSize: 10.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.mic),
                                  onPressed: () {
                                    // Action for adding a photo
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    MyFlutterApp.attach,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    // Action for attaching a file
                                  },
                                ),
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Write a comment...',
                                      hintStyle: TextStyle(
                                        color: Color(0xff5a55cd),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    MyFlutterApp.paper_plane,
                                    size: 22,
                                  ),
                                  onPressed: () {
                                    // Action for sending the comment
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
