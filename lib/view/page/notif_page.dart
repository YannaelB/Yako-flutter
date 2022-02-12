import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yako2/util/fire_helper.dart';
import 'package:yako2/view/my_material.dart';
import 'package:yako2/models/user.dart';
import 'package:yako2/models/notification.dart';
import 'package:yako2/view/tiles/notif_tile.dart';

class NotifPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<QuerySnapshot>(
      stream: FireHelper().fire_notif.document(me.uid).collection("singleNotif").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snaps) {
        if (!snaps.hasData) {
          return Center(child: MyText("aucune notification", color: pointer, fontSize: 40.0,));
        } else {
          // créer notifs
          List<DocumentSnapshot> documents = snaps.data.documents;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext ctx, int index) {
              Notif notif = Notif(documents[index]);
              return NotifTile(notif);
            },);
        }
      },
    );
  }
}