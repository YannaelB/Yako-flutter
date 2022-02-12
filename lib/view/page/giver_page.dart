import 'package:flutter/material.dart';
import 'package:yako2/view/my_material.dart';


//page qui vient après celle des assos
//cf CdC

class GiverPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    double hauteur1 = (hauteur/18)*11.5;

    return Container(
      //width: largeur, height: hauteur,
      color: Colors.deepPurple,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.pink,
            width: largeur, height: hauteur1,
          ),
          Container(
            width: largeur/2.3, height: hauteur- (hauteur1 + hauteur/10) ,
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: bleu4,
                  splashColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0/2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Classement Giver",style: TextStyle(fontSize: 18, fontStyle: FontStyle.normal, color: white, letterSpacing: 0.9, )),

                    ],
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  color: bleu4,
                  splashColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0/2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Random Giver",style: TextStyle(fontSize: 18, fontStyle: FontStyle.normal, color: white, letterSpacing: 0.9, )),

                    ],
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  color: bleu4,
                  splashColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0/2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Random Viewer",style: TextStyle(fontSize: 18, fontStyle: FontStyle.normal, color: white, letterSpacing: 0.9, )),

                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}