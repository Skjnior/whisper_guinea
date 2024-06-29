import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/listchat.dart';
import 'LsitConversation.dart';

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeff3fe),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
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
                            "All chats",
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
                    elevation: 8,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                        left: 5,
                        right: 5,
                      ),
                      padding: EdgeInsets.only(
                          top: 5, left: 15, right: 20,),
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
                                final imagepath = message["image"];
                                final status = message["status"];
                                final author = message["isMe"];
                                var blueViolet = Color(0xff5a55cd);
                                return  Material(
                                  color: Color(0xffeff3fe),
                                  child: InkWell(
                                      /*Padding(
                                        padding: EdgeInsets.only(left: 75.0),
                                        child: Divider(
                                          color: blueViolet.withOpacity(0.5),
                                          height: 2,
                                        ),
                                      )*/
                                    splashColor: Color(0xff5a55cd), // Définir la couleur de l'effet de splash comme transparente
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatScreen(
                                            text: chat,
                                            isSentByMe: author,
                                            time: time,
                                            userName: name,
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage(
                                            imagepath,
                                        ),
                                      ),
                                      title: Text(
                                        name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        chat,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(time),
                                          if (status)
                                            Icon(Icons.circle, color: Colors.purple, size: 12),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
