import 'package:fluntitled/models/post.dart';
import 'package:flutter/material.dart';

class PostGrid extends StatelessWidget {
  final List<Post> posts;

  PostGrid({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          child: Text (
              posts[index].title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900
              )
          ),
          decoration: BoxDecoration (
              borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              color: Colors.grey
          ),
          padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        );
      },
    );
  }
}