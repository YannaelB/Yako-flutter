import 'package:flutter/material.dart';
import 'package:yako2/view/page/assoce_page.dart';
import 'package:yako2/view/page/giver_page.dart';
import 'package:yako2/view/page/new_postpage.dart';
import 'package:yako2/view/page/users_page.dart';

// homePage => page principal de l'application sur laquelle il y a les interactions avec Assos et Giver

class MenuPage extends StatefulWidget{
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  var _pages = [AssocePage(),GiverPage(),UserPage(),NewPost(),];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      //appBar: AppBar(title: Text("here"),),
      body: PageView(
        children: _pages,
      ),

    );
  }
}