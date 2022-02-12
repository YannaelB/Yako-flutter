import 'package:flutter/material.dart';
import 'package:yako2/view/my_material.dart';


// fonction pour le bouton animé sur la page de connexion

class Menu2Items extends StatelessWidget{

  final String item1;
  final String item2;
  final PageController pageController;

  Menu2Items({@required String this.item1, @required String this.item2,@required PageController this.pageController});

  @override
  Widget build(BuildContext context){
    //TODO: implement build
    return Container(
      width: 300.0,     // redimentionner avec des MediaQuery
      height: 50.0,

      decoration: BoxDecoration( color: white, borderRadius: BorderRadius.all(Radius.circular(25.0)), ),

      child: CustomPaint(

        painter: MyPainter(pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[itemButtom(item1), itemButtom(item2)],
        ),
      )
    );
  }

  Expanded itemButtom(String name){
    return Expanded(child: FlatButton(
      onPressed: () {
        int page = (pageController.page == 0.0) ? 1 : 0;
        pageController.animateToPage(page, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
      },
      child: Text(name, style: TextStyle(fontSize: 15, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, color: Colors.black, fontFamily: "Raleway", letterSpacing: 0.8, ))),
    );
  }
}