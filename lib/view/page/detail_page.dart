import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yako2/models/comment.dart';
import 'package:yako2/view/my_material.dart';
import 'package:yako2/models/post.dart';
import 'package:yako2/models/user.dart';
import 'package:yako2/view/tiles/post_tile.dart';
import 'package:yako2/view/tiles/comment_tile.dart';

class DetailPage extends StatelessWidget {

  User user;
  Post post;

  DetailPage(this.post, this.user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<DocumentSnapshot> (
      stream: post.ref.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
        if ( snapshot.hasData) {
          Post newPost = Post(snapshot.data);
          return ListView.builder(
              itemCount: newPost.comments.length +1,
              itemBuilder: (BuildContext ctx, int index) {
            if (index == 0) {
              return PostTile(post: newPost, user: user, detail: true,);
            } else {
              Comment comment = Comment(newPost.comments[index - 1]);
              return CommentTile(comment);
            }
          });
        } else {
          return LoadingCenter();
        }
      },
    );
  }
}