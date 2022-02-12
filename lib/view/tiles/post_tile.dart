import 'package:flutter/material.dart';
import 'package:yako2/controller/detail_post.dart';
import 'package:yako2/models/post.dart';
import 'package:yako2/models/user.dart';
import 'package:yako2/util/date_helper.dart';
import 'package:yako2/util/fire_helper.dart';
import 'package:yako2/view/my_material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostTile extends StatelessWidget {

  final Post post;
  final User user;
  final bool detail;

  PostTile({@required Post this.post, @required User this.user, bool this.detail: false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      child: Card(
        elevation: 5.0,
        child: PaddingWith(
          top: 10.0, left: 10.0, right: 10.0, bottom: 10.0,
          widget: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ProfileImage( urlString: user.imageUrl, onPressed: null),
                  Column(
                    children: <Widget>[
                      MyText("${user.pseudo}", color: Colors.black),
                      MyText(DateHelper().myDate(post.date), color: Colors.black),
                    ],

                  ),
                ],
              ),
              (post.imageUrl != null && post.imageUrl != "") ?
                  PaddingWith(widget: Container(width: MediaQuery.of(context).size.width, height: 1.0, color: Colors.grey,))
                  : Container(height: 0.0,),
              (post.imageUrl != null && post.imageUrl != "") ?
                  PaddingWith( widget : Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(image: CachedNetworkImageProvider(post.imageUrl), fit: BoxFit.cover)),
                  ))
                  : Container ( height: 0.0,),
              (post.text != null && post.text != "") ?
                  PaddingWith(widget: Container(width: MediaQuery.of(context).size.width, height: 1.0, color: Colors.green,))
                  : Container(height: 0.0,),
          (post.text != null && post.text != "") ?
                  PaddingWith(widget: MyText(post.text, color: baseAccent,))
                  : Container(height: 0.0,),
              PaddingWith(widget: Container(width: MediaQuery.of(context).size.width, height: 1.0, color: Colors.pink,)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(icon: (post.likes.contains(me.uid) ? likeFull : likeEmpty), onPressed: () => FireHelper().addLike(post),),
                  MyText(post.likes.length.toString(), color: baseAccent,),
                  IconButton(icon: msgIcon, onPressed: () {
                    if (!detail) {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) {
                        return DetailPost(post, user);
                      }));
                    }
                  },),
                  MyText(post.comments.length.toString(), color: baseAccent,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}