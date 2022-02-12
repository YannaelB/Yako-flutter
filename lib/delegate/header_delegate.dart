import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yako2/models/user.dart';
//import 'package:yako2/util/alert_helper.dart';
import 'package:yako2/view/my_material.dart';
import 'package:yako2/view/page/new_postpage.dart';
import 'dart:io';
import 'package:yako2/util/fire_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagebutton/imagebutton.dart';


class MyHeader extends SliverPersistentHeaderDelegate {

  User user;
  User other;
  VoidCallback callback;
  bool scrolled;
  //bool testEmojy = true;



  MyHeader ({ @required this.user, @required this.callback, @required this.scrolled});

  bool _isMe = false;


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build

    _isMe = (user.uid == me.uid);

    return Container(
      margin: EdgeInsets.only( bottom: 1.0),
      padding: EdgeInsets.all(2.0),
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(width: MediaQuery.of(context).size.width, height: 1.0,color: Colors.grey),
          (scrolled) ? Container(width: 0.0, height: 0.0) : Container(child: element( (user.surname == null)? ("name") : "${user.surname} ${user.name}")),  //disparait quand on scroll
          (scrolled) ? Container(width: 0.0, height: 0.0) : Container(child: element2((user.description == null)? ("Aucune description") : user.description),
          ),
          //boutons emojy qui servent de like pour évaluer les profils ( à modifier si possible car utilise des données firebase)
          Container(
            //width: 100.0, height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 50.0, height: 50.0 ,
                      color: white,
                      child: FlatButton(
                        padding: EdgeInsets.all(1.0),
                        child: (me.Emoting1.contains(user.uid)) ? Image.asset("assets/00.3.jpg", fit: BoxFit.fill,) : Image.asset("assets/0.3.jpg", fit: BoxFit.fill,),
                        onPressed: () => (_isMe) ?   Rien() : FireHelper().addEmot1(user),
                      ),
                    ),
                    Text(user.Emoter1.length.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 0.8,)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 50.0, height: 50.0 ,
                      color: white,
                      child: FlatButton(
                        padding: EdgeInsets.all(1.0),
                        child: (me.Emoting2.contains(user.uid)) ? Image.asset("assets/11.3.png", fit: BoxFit.fill,) : Image.asset("assets/1.3.png", fit: BoxFit.fill,),
                        onPressed: () => (_isMe) ?   Rien() : FireHelper().addEmot2(user),
                      ),
                    ),
                    MyText(user.Emoter2.length.toString(), color: Colors.black,),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 50.0, height: 50.0 ,
                      color: white,
                      child: FlatButton(
                        padding: EdgeInsets.all(1.0),
                        child: (me.Emoting3.contains(user.uid)) ? Image.asset("assets/22.3.jpg", fit: BoxFit.fill,) : Image.asset("assets/2.3.jpg", fit: BoxFit.fill,),
                        onPressed: () => (_isMe) ?   Rien() : FireHelper().addEmot3(user),
                      ),
                    ),
                    MyText(user.Emoter3.length.toString(), color: Colors.black,),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 50.0, height: 50.0 ,
                      color: white,
                      child: FlatButton(
                        padding: EdgeInsets.all(1.0),
                        child: (me.Emoting4.contains(user.uid)) ? Image.asset("assets/33.3.png", fit: BoxFit.fill,) : Image.asset("assets/3.3.png", fit: BoxFit.fill,),
                        onPressed: () => (_isMe) ?   Rien() : FireHelper().addEmot4(user),
                      ),
                    ),
                    MyText(user.Emoter4.length.toString(), color: Colors.black,),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 50.0, height: 50.0 ,
                      color: white,
                      child: FlatButton(
                        padding: EdgeInsets.all(1.0),
                        child: (me.Emoting5.contains(user.uid)) ? Image.asset("assets/44.3.jpg", fit: BoxFit.fill,) : Image.asset("assets/4.3.jpg", fit: BoxFit.fill,),
                        onPressed: () => (_isMe) ?   Rien() : FireHelper().addEmot5(user),
                      ),
                    ),
                    MyText(user.Emoter5.length.toString(), color: Colors.black,),
                  ],
                ),
              ],
            ),
          ),
          //(user.identity == "Assoce")  ? Text("assoce") : Container(width: 0.0, height: 0.0,),
          //(_isMe ) ? Text("moi") : Text("pas moi"),

          Container(width: MediaQuery.of(context).size.width, height: 1.0,color: Colors.grey),
        ],
      ),
    );
  }

  Rien(){

  }

  Widget element( String text) {   //name et surname (pas forcément unique)
    if (user.uid == me.uid) {
      return Center(
        child: Container( width: 400, height: 100,
          child: InkWell(
            child: MyText(text),
            onTap: callback,
          ),
        ),

      );
    } else {
      return MyText(text);
    }
  }

  Widget element2( String text) {  // description de l'utilisateur
    if (user.uid == me.uid) {
      return Center(
        child: Container( width: 80.0, height: 20.0,    // taille description et retour à la ligne à modifier car dépasse du container et erreur //
          child: InkWell(
            child: MyText(text),
            onTap: callback,
          ),
        ),

      );
    } else {
      return MyText(text);
    }
  }


  @override double get maxExtent => (scrolled)? 150.0 : 200.0;

  @override double get minExtent => (scrolled)? 150.0 : 200.0;

  @override bool shouldRebuild(MyHeader oldDelegate) => scrolled != oldDelegate.scrolled || user != oldDelegate.user;

}