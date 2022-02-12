import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yako2/models/post.dart';
import 'package:yako2/util/alert_helper.dart';
import 'package:yako2/view/my_material.dart';
import 'package:yako2/models/user.dart';
import 'package:yako2/util/fire_helper.dart';
import 'package:yako2/delegate/header_delegate.dart';
import 'package:yako2/view/tiles/post_tile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yako2/view/page/new_page.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:yako2/view/page/new_postpage.dart';
import 'package:yako2/view/page/drawer_page.dart';
import 'package:show_drawer/show_drawer.dart';



class ProfilPage extends StatefulWidget{

  User user;
  ProfilPage(this.user);

  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<ProfilPage> {


  //User user;
  int valider = 0;
  bool _isMe = false;
  ScrollController controller;
  TextEditingController _name;
  TextEditingController _surname;
  TextEditingController _desc;
  double expanded = 200.0;
  bool get _showTitle {
    return controller.hasClients && controller.offset > expanded - kToolbarHeight;
  }

  StreamSubscription subscription;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isMe = (widget.user.uid == me.uid);
    controller = ScrollController()..addListener(() {
      setState(() {

      });
    });
    _name = TextEditingController();
    _surname = TextEditingController();
    _desc = TextEditingController();
    subscription = FireHelper().fire_user.document(widget.user.uid).snapshots().listen((data) {
      setState(() {
        widget.user = User(data);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    _name.dispose();
    _surname.dispose();
    _desc.dispose();
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    bool fermeture = false;


    // TODO: implement build
    return StreamBuilder<QuerySnapshot>(
      stream: FireHelper().postsFrom(widget.user.uid),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (!snapshot.hasData){
          return LoadingScaffold();
        } else {
          List<DocumentSnapshot> documents = snapshot.data.documents;
          return CustomScrollView(
            controller: controller,
            slivers: <Widget>[
              SliverAppBar(
                pinned:true,
                expandedHeight: MediaQuery.of(context).size.height*0.20,
                actions: <Widget>[

                  ( _isMe) ? Container(width: MediaQuery.of(context).size.width*0.9, height: 1.0,) : Container(width: 0.0, height: 0.0,),
                  if (_isMe) Expanded(
            child: IconButton(
              icon: Icon(Icons.dehaze),
              color: Colors.black,
              iconSize: 20.0,
              //child: Text(title),
              onPressed: () => showDrawer( // ouvre une fenetre de paramètre quand clic sur l'icon setting
                barrier: true,
                context: context,
                direction: DrawerDirection.centerRight,
                barrierDismissible: true,
                builder: (_, __, close) => Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          height: MediaQuery.of(context).size.height*0.31,
                            decoration: BoxDecoration(color: bleu4, borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0)),),
                        ),
                        Card(
                          elevation: 10.0,
                          child: Container(
                            color: bleu4,
                            width: MediaQuery.of(context).size.width*0.7,
                            height: MediaQuery.of(context).size.height*0.1,
                            child: RaisedButton(
                              color: white,
                              splashColor: Colors.blueGrey[200],
                              /////onLongPress: Bravo vous venez de trouver un cadeau ... voir CdC
                              onLongPress: () => close,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container( child: Icon( Icons.arrow_left),),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        MyText("Devenir Giver"),
                                        Text(" "),
                                        Icon(Icons.add),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10.0,
                          child: Container(
                            color: bleu4,
                            width: MediaQuery.of(context).size.width*0.7,
                            height: MediaQuery.of(context).size.height*0.1,
                            child: RaisedButton(
                              color: white,
                              splashColor: Colors.blueGrey[200],

                              onPressed: () {
                                // tentative pour fermer la page drawer lorsqu'on clique sur un bouton mais ne marche pas

                                //Navigator.pop(context);

                                fermeture = true;
                                if(fermeture == true) {
                                   close;
                                }
                                },


                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container( child: Icon( Icons.arrow_left),),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        MyText("News"),
                                        Text(" "),
                                        Icon(Icons.mail_outline),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10.0,
                          child: Container(
                            color: bleu4,
                            width: MediaQuery.of(context).size.width*0.7,
                            height: MediaQuery.of(context).size.height*0.1,
                            child: RaisedButton(
                              color: white,
                              splashColor: Colors.blueGrey[200],
                              onPressed: close,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container( child: Icon( Icons.arrow_left),),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        MyText("PUB"),
                                        Text(" "),
                                        Icon(Icons.attach_money),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10.0,
                          child: Container(
                            color: bleu4,
                            width: MediaQuery.of(context).size.width*0.7,
                            height: MediaQuery.of(context).size.height*0.1,
                            child: RaisedButton(
                              color: white,
                              splashColor: Colors.blueGrey[200],
                              onPressed: close,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container( child: Icon( Icons.arrow_left),),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        MyText("Paramètre"),
                                        Text(" "),
                                        Icon(Icons.settings),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10.0,
                          child: Container(
                            color: bleu4,
                            width: MediaQuery.of(context).size.width*0.7,
                            height: MediaQuery.of(context).size.height*0.1,
                            child: RaisedButton(
                              color: white,
                              splashColor: Colors.blueGrey[200],
                              onPressed: (close),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container( child: Icon( Icons.arrow_left),),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        MyText("Yako"),
                                        Text(" "),
                                        Icon(Icons.info),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10.0,
                          child: Container(
                            color: bleu4,
                            width: MediaQuery.of(context).size.width*0.7,
                            height: MediaQuery.of(context).size.height*0.1,
                            child: RaisedButton(
                              color: white,
                              splashColor: Colors.blueGrey[200],
                              onPressed: () {
                                AlertHelper().disconnect(context);
                                //showDrawer.close;
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container( child: Icon( Icons.arrow_left),),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        MyText("Deconnexion"),
                                        Text(" "),
                                        Icon(Icons.flight_takeoff),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0),),
                  ),
                ),
              ),
            ),
                  ) else FollowButton(user: widget.user),

                ],

                // partie supérieur du profil ( abonné/psuedo/photo..)
                flexibleSpace: FlexibleSpaceBar(
                  title: _showTitle ? MyText(widget.user.pseudo) : MyText(""),
                  background: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.3,
                    color: white,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ProfileImage(urlString: widget.user.imageUrl, size: 56.0, onPressed: changeUser),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(height:MediaQuery.of(context).size.height*0.07, width: 0.0,),
                              Container(
                                  child: Text( "${widget.user.pseudo}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 0.8,))),
                              //ATTENTION LE PSEUDO DOIT ETRE UNIQ
                              Container(height:20.0, width: 0.0,),
                              Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 3.0, right: 3.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black, width: 1.0),
                                          borderRadius: BorderRadius.circular(5.0)),
                                      child: Text("${widget.user.identity}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black, letterSpacing: 0.8,)),),
                                    Container(width:MediaQuery.of(context).size.height*0.05, height: 0.0,),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(" ${widget.user.followers.length -1}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 0.8,)),
                                          Container(height:MediaQuery.of(context).size.height*0.002, width: 0.0,),
                                          Text("Followers",style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black, letterSpacing: 0.8,)),
                                        ],

                                      ),
                                    ),
                              ]
                                // Identity
                              ),
                              //Container(height:MediaQuery.of(context).size.height*0.05, width: 0.0,),
                              //Container( child: Text("here_now",style: TextStyle(fontSize: 20))),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //Container(height:MediaQuery.of(context).size.height*0.1, width: 0.0,),
                            ],
                          ),
                          Column(
                            children: <Widget>[Container(height: 10.0, width: 50,),],
                          ),
                        ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: MyHeader(user: widget.user, callback: changeFields, scrolled: _showTitle),
              ),
              SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, index) {
                if (index == documents.length)
                  return ListTile(title: MyText("___________"),);  // CHECKER EN CHANGEANT PAR CONTAINER
                if ( index > documents.length)
                  return null;
                Post post =  Post(documents[index]);
                return PostTile(post: post, user: widget.user);
              })
              )
            ],
          );
        }
      }
    );
  }

  void changeFields () {
    AlertHelper().changeUserAlert(context, name: _name, surname: _surname, desc: _desc);
  }
  void changeUser() {

    // fonction différente selon si l'on est sur notre profil ou regade celui d'un autre
    //ouvre une fenetre quand clic sur la Pdp

    if(widget.user.uid == me.uid) {
      showModalBottomSheet(context: context, builder: (BuildContext ctx) {
        return Container(
          color: Colors.transparent,
          child: Card(
            elevation: 10.0,
            margin: EdgeInsets.all(20),
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,),
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Modifier votre photo :", style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, color: Colors.black, letterSpacing: 0.8, )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(icon: camIcon, onPressed: (() {
                        takePicture(ImageSource.camera);
                      })),
                      IconButton(icon: GalleryIcon, onPressed: (() {
                        takePicture(ImageSource.gallery);
                      })),
                    ],
                  ),
                  Row (
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(width: 150.0, height: 50,
                            child :FlatButton(
                              child: Text("Annuler", style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, color: white, letterSpacing: 0.8, )),
                              color: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0/2)),
                              onPressed: () {
                                valider = 0;
                                Navigator.pop(ctx);

                                },)),

                        Container(width: 150.0, height: 50,
                            child :FlatButton(
                              child: Text("Valider", style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, color: white, letterSpacing: 0.8, )),
                              color: bleu4,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0/2)),
                              onPressed: () {
                                valider = 1;
                                Navigator.pop(ctx);

                              },)),
                      ]),
                ],
              ),
            ),
          ),
        );
      });
    } else {
      showModalBottomSheet(context: context, builder: (BuildContext ctx) {
        return Container(
          color: Colors.transparent,
          child: Card(
            elevation: 10.0,
            margin: EdgeInsets.all(20),
            color: Colors.transparent,
            child: Container(
              //color: white,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("membre depuis :", style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, color: Colors.black, letterSpacing: 0.8, )),
                  Text(" Pub regardée :", style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, color: Colors.black, letterSpacing: 0.8, )),
                  Text(" Emoji distribué :", style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, color: Colors.black, letterSpacing: 0.8, )),
                  // rajouter la quantité d'argent distribué pour les giver
                ],
              ),
            ),
          ),
        );
      });
    }
  }

  Future<void> takePicture(ImageSource source) async{
    File file =  await ImagePicker.pickImage(source: source, maxHeight: 300.0, maxWidth: 300.0);  // Taille maximal de l'image
    if ( valider == 1) {
      FireHelper().modifyPicture(file);
    }
  }

  //fonction pour changer la photo que si l'on accepte
  validate() {

  }

}

