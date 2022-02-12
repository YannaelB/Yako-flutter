import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:yako2/view/my_widgets/constant.dart';
import 'controller/main_app_controller.dart';
import 'controller/log_controller.dart';
import 'package:yako2/test/slider.dart';

import 'package:yako2/models/user.dart';
import 'package:yako2/view/my_material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


bool mem = true;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        canvasColor: Colors.transparent,
        primaryColor: bleu4,
        accentColor: pointer,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (mem == false) ? Landing() : AuthIntro(),
      /*
      Normalement l'application devrait commencer par ''Landing'' mais je n'arrive pas à effectuer ce que je voudrais
      donc pour éviter les erreur et gagner du temps j'ai créé le bool mem pour créer un racourci et ouvrir directement la page de connexion
      #CdC pour savoir objectif
       */

      routes: {
       AuthIntro.routeName: (ctx) => AuthIntro(),

      },
    );
  }
}


class Landing extends StatefulWidget {

  @override
  _LandingState createState() => _LandingState();
  }


//page de présentation lors du téléchargement uniquement :
class _LandingState extends State<Landing> {


  int _currentPage = 0;
  PageController _controller = PageController();



  List<Widget> _pages = [SliderPage(title: "Assoce", description: "A Remplir", image: "assets/darkBee.png"),
  SliderPage(title: "Giver", description: "A Remplir", image: "assets/darkBee.png"),
  SliderPage(title: "Viewer", description: "A Remplir", image: "assets/darkBee.png"),
    SliderPage2(title: "?", description: "A Remplir", image: "assets/darkBee.png"),
  ];

  _onchanged(int index) {
  setState(() {_currentPage = index;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
              },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 10 : 10,
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage) ?
                            bleu4 : Colors.blue.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOutQuint);
                  },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 500),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: bleu4,
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1)) ?
                  Container(width: 200.0, height: 100.0,
                      child :FlatButton(
                        child: Text("Start", style: TextStyle(color: Colors.white, fontSize: 20,)),
                          color: Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0/2)),
                        onPressed: () {
                          mem = true;
                          Navigator.of(context).pushNamed(AuthIntro.routeName);
                          },))
                      : Icon(Icons.navigate_next, size: 50, color: Colors.white,),),),
              SizedBox(height: 50.0,)],
          ),
        ],
      ),
    );
  }
}


//Page de connexion ou création compte
class AuthIntro extends StatelessWidget {

  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _handleAuth();
  }

  Widget _handleAuth() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        return (!snapshot.hasData) ? LogController()  : MainAppController(snapshot.data.uid);
      },
    );
  }
}
