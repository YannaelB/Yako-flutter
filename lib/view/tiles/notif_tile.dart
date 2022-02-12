import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yako2/models/post.dart';
import 'package:yako2/util/fire_helper.dart';
import 'package:yako2/view/my_material.dart';
import 'package:yako2/models/user.dart';
import 'package:yako2/models/notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yako2/controller/detail_post.dart';
import 'package:yako2/view/page/profil_page.dart';

class NotifTile extends StatelessWidget {

  Notif notif;
  NotifTile(this.notif);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<DocumentSnapshot>(
      stream: FireHelper().fire_user.document(notif.userId).snapshots(),
      builder: (BuildContext ctx, AsyncSnapshot<DocumentSnapshot> snap) {
        if (!snap.hasData) {
          return Container();
        } else {
          User user = User(snap.data);
          return InkWell(
            onTap: () {
              notif.notifRef.updateData({keySeen: true});
              if (notif.type == keyFollowers) {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext build) {
                  return Scaffold(body: SafeArea(child: ProfilPage(user)));
                }));
              } else {
                notif.ref.get().then((snap) {
                  Post post = Post(snap);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) {
                    return DetailPost(post, user);
                  }));
                });
              }
            },
            child: Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
              child: Card(
                elevation: 5.0,
                color: (!notif.seen) ? white : base,
                child: Container (
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ProfileImage(urlString: user.imageUrl , onPressed: null,), // A RAJOUTTER
                          MyText(notif.date, color: pointer,)
                        ],
                      ),
                      MyText(notif.text, color: baseAccent,)
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}