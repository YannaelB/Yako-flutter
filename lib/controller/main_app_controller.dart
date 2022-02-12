import 'dart:async';
import 'package:yako2/util/fire_helper.dart';
import 'package:flutter/material.dart';
import 'package:yako2/view/my_material.dart';
import 'package:yako2/models/user.dart';
import 'package:yako2/view/page/feed_page.dart';
import 'package:yako2/view/page/new_postpage.dart';
import 'package:yako2/view/page/profil_page.dart';
import 'package:yako2/view/page/users_page.dart';
import 'package:yako2/view/page/notif_page.dart';
import 'package:yako2/view/page/worldMap_page.dart';
import 'package:yako2/main.dart';
import 'package:yako2/view/page/menu_page.dart';
import 'package:show_drawer/show_drawer.dart';

class MainAppController extends StatefulWidget{

  String uid;
  MainAppController(this.uid);

  _MainState createState() => _MainState();

}

class _MainState extends State<MainAppController> {

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  StreamSubscription streamListener;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Crée une souscription au stream
    streamListener = FireHelper().fire_user.document(widget.uid).snapshots().listen((document) {
      setState(() {
        me = User(document);
        //mem = true;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //Arreter le stream
    streamListener.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    return (me == null)?  LoadingScaffold(): Scaffold(
      key: _globalKey,
      backgroundColor: white,
      bottomNavigationBar: BottomBar(
          items:
          [BarItem(icon: filIcon, onPressed: (() => buttonSelected(0)), selected: index == 0),
            BarItem(icon: notifIcon, onPressed: (() => buttonSelected(1)), selected: index == 1),
            BarItem(icon: homeIcon, onPressed: (() => buttonSelected(2)), selected: index == 2),
            BarItem(icon: profilIcon, onPressed: (() => buttonSelected(3)), selected: index == 3),
            Container(width: 0.0, height: 0.0),
            Container(width: 0.0, height: 0.0),
          ]
      ),
      body: showPage(),
      floatingActionButton: FloatingActionButton(onPressed: write, child: worldIcon, backgroundColor: baseAccent,),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
  write(){
    showDrawer(
      barrier: true,
      context: context,
      direction: DrawerDirection.bottomCenter,
      barrierDismissible: true,
      builder: (_, __, close) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.7,
          decoration: BoxDecoration(color: white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),),
      ),
    );
  }

  buttonSelected(int index) {
    print( index);
    setState(() {
      this.index = index;
    });
  }
  showPage(){
    switch (index) {

      case 2: return MenuPage();
      case 0: return FeedPage(widget.uid);
      case 1: return NotifPage();
      default: return ProfilPage(me);
    }
  }
}