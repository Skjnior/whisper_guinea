import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whisper_guinea/screens/notification_screnn.dart';
import 'package:whisper_guinea/screens/post_screen.dart';

import 'LsitConversation.dart';
import '../models/postModel.dart';
import 'listMessage.dart';
import 'freind_screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}




class _Home_ScreenState extends State<Home_Screen> {

  bool showPopularOnly = false;




  List<Post> allPosts = [
    Post(
      category: "Technology",
      votes: 123,
      title: "The future of AI",
      content: "AI is transforming industries and everyday life...",
      comments: ["Great post!", "Very informative."],
    ),
    Post(
      category: "Health",
      votes: 85,
      title: "Healthy Living Tips",
      content: "Simple ways to stay healthy...",
      comments: [],
    ),
    Post(
      category: "Education",
      votes: 200,
      title: "Online Learning",
      content: "The rise of online learning platforms...",
      comments: ["Amazing insight!", "I love online learning.", "Great article!", "Thanks for sharing!", "Very helpful!", "Interesting perspective!", "Well written!", "Agreed!"],
    ),
    // Ajoutez d'autres posts ici
  ];




  @override
  Widget build(BuildContext context) {
    List<Post> filteredPosts = showPopularOnly ? allPosts.where((post) => post.votes > 100 && post.comments.isNotEmpty).toList() : allPosts;

    return Scaffold(
      /*floatingActionButton: FloatingActionButton(
        splashColor: Color(0xff5a55cd),
        onPressed: () {

        },
        backgroundColor: Color(0xffeef2fe),
        child: Icon(
          CupertinoIcons.search,
          color: Color(0xff5a55cd),
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffeff3fe),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.8,
            colors: [
              Color(0xff5a55cd), // Couleur de début du dégradé
              Color(0xff5a55cd), // Couleur de fin du dégradé
            ],
            stops: [0.2, 0.8], // Positions des couleurs dans le dégradé
          ),
        ),
        child: Stack(
          children: [

            const SizedBox(height: 10),


            Material(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)
              ),
              elevation: 8,
              child: Container(
                margin: EdgeInsets.only(bottom: 3, left: 4, right: 4),
                height: 760,
                decoration: const BoxDecoration(
                  color: Color(0xfff1f3ff),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      color: Color(0xfff1f3ff),
                      margin: EdgeInsets.only(left: 15, right: 15,),
                      height: 90,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("data"),
                          Icon(
                            Icons.menu
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: filteredPosts.map((post) => PostCard(post: post, commentsToShow: 5)).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Color(0xff5a55cd),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Screen()));
                },
                icon: const Icon(
                    CupertinoIcons.home,
                    color: Colors.white
                )
            ),
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MessageList()));
                },
                icon: const Icon(
                    CupertinoIcons.chat_bubble,
                    color: Colors.white
                )
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                      color: Colors.white
                  )
              ),
              child: IconButton(
                  onPressed: (){
                  },
                  icon: const Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                  )
              ),
            ),

            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScren()));

                },
                icon: const Icon(
                    Icons.notifications_active,
                    color: Colors.white
                )
            ),

            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FriendScreen()));
                },
                icon: const Icon(
                    CupertinoIcons.person_2_alt,
                    color: Colors.white
                )
            ),
          ],
        ),
      ),
    );
  }




  Widget buildBottomNavigationBar(BuildContext context, int currentIndex) {
    return Positioned(
      bottom: 5,
      left: 0,
      right: 0,
      height: 60,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.only(bottom: 8, left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                if (currentIndex != 0) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home_Screen()));
                }
              },
              icon: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                if (currentIndex != 1) {
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                }
              },
              icon: const Icon(
                CupertinoIcons.chat_bubble,
                color: Colors.white,
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: IconButton(
                onPressed: () {
                  if (currentIndex != 2) {
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddScreen()));
                  }
                },
                icon: const Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (currentIndex != 3) {
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                }
              },
              icon: const Icon(
                Icons.notifications_active,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                if (currentIndex != 4) {
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                }
              },
              icon: const Icon(
                CupertinoIcons.person_2_alt,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
