import 'package:fluntitled/models/post.dart';
import 'package:fluntitled/post_tile.dart';
import 'package:flutter/material.dart';
class PostList extends StatelessWidget {
  final List<Post> posts;

  PostList({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return new PostTile(post: posts[index]);
      }
    );
  }
}