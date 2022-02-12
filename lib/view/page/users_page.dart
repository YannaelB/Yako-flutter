import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yako2/view/my_material.dart';
import 'package:yako2/models/user.dart';
import 'package:yako2/util/fire_helper.dart';
import 'package:yako2/view/tiles/user_tile.dart';


class UserPage extends StatefulWidget{

  User user;
  //UserPage(this.user);
  _UserState createState() => _UserState();

}

class _UserState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<QuerySnapshot> (
      stream: FireHelper().fire_user.snapshots(),  //includeMetadataChanges: widget.user.identity == "Assoce"
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<DocumentSnapshot> documents = snapshot.data.documents;
          return NestedScrollView(
            headerSliverBuilder: (BuildContext build, bool scrolled) {
              return [MyAppBar(title: "liste des  utilisateurs", image: eventImage,)];
            },
            body: ListView.builder(
              itemCount: documents.length,
              itemBuilder: (BuildContext ctx, int index) {
                User user = User(documents[index]);
                return UserTile(user);
              },
            ),
          );
        } else {
          return LoadingScaffold();
        }
      },
    );
  }
}