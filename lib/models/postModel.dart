import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post {
  final String category;
  final int votes;
  final String title;
  final String content;
  final List<String> comments;

  Post({
    required this.category,
    required this.votes,
    required this.title,
    required this.content,
    required this.comments,
  });
}



