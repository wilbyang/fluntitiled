import 'package:fluntitled/models/post.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Post post;
  PostTile({Key key, this.post}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text (
          post.title,
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
  }

}