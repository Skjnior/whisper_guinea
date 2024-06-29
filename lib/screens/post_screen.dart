import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/postModel.dart';


class PostCard extends StatelessWidget {
  final Post post;
  final int commentsToShow;

  PostCard({required this.post, this.commentsToShow = 5});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0)
          ),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    "assets/images/Sorxez.png",
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text("User"),
                subtitle: Text("Il y'a 2j"),
                trailing: Text("12:12"),
              ),
              SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  "assets/images/Sorxez.png",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.category,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${post.votes} votes',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                post.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                post.content,
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailPage(post: post)),);
                    },
                  ),
                  Text('${post.comments.length} comments'),
                ],
              ),
              if (post.comments.isNotEmpty) ...[
                SizedBox(height: 8),
                ...post.comments.take(commentsToShow).map((comment) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    comment,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                )).toList(),
                if (post.comments.length > commentsToShow)
                  TextButton(
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailPage(post: post)),);
                    },
                    child: Text('View all comments'),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}