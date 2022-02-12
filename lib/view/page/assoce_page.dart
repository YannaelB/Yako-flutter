import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yako2/view/my_material.dart';


// page sur laquelle l'utilisateur regarder des publicités pour les Assos


class AssocePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    double hauteur1 = (hauteur/3)*2;
    double n = 2.7;
    double m = 14.5;
    double k = 18.0;
    double p = 24.0;

    return Container(
      //width: largeur, height: hauteur,
      color: white,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            color: white,
            width: largeur, height: hauteur1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          color: white,
                          width: largeur/1.6, height: 16.0,
                          child: Text("Assos comptent sur vous",style: TextStyle(fontSize: 13, fontStyle: FontStyle.normal, color: Colors.grey, letterSpacing: 0.8,)),
                        ),
                        Container(width: largeur/1.1, height: 1.0, color: Colors.grey,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: largeur/n, height: hauteur/m ,
                          color: white,
                          child: RaisedButton(
                            color: white,
                            splashColor: Colors.blueGrey,
                            elevation: 15.0,
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0/2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("RoadHelp",style: TextStyle(fontSize: k, fontStyle: FontStyle.normal, color: bleu4, letterSpacing: 0.9, )),
                                //Text("     "),
                                Icon( Icons.directions_car, color: bleu4,size: p),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: largeur/n, height: hauteur/m ,
                          color: white,
                          child: RaisedButton(
                            color: white,
                            splashColor: Colors.blueGrey,
                            elevation: 15.0,
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0/2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Planète",style: TextStyle(fontSize: k, fontStyle: FontStyle.normal, color: bleu4, letterSpacing: 0.9, )),
                                //Text("   "),
                                Icon( Icons.public, color: bleu4, size: p),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: largeur/3, height: hauteur/m ,
                          color: white,
                          child: RaisedButton(
                            color: white,
                            splashColor: Colors.blueGrey,
                            elevation: 15.0,
                            //colorBrightness: Brightness.dark,
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0/2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Femme",style: TextStyle(fontSize: k, fontStyle: FontStyle.normal, color: bleu4, letterSpacing: 0.9, )),
                                //Text("  "),
                                Icon( Icons.wc, color: bleu4,size: p,),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Image(image: logoImage, height: 80.0, width: 90.0, ),
                        Container(
                          width: largeur/3, height: hauteur/m ,
                          color: white,
                          child: RaisedButton(
                            color: white,
                            elevation: 10.0,
                            splashColor: Colors.blueGrey,
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0/2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Animaux",style: TextStyle(fontSize: k, fontStyle: FontStyle.normal, color: bleu4, letterSpacing: 0.9, )),
                                //Text("   "),
                                Icon( Icons.pets, color: bleu4, size: p),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: largeur/n, height: hauteur/m ,
                          color: white,
                          child: RaisedButton(
                            color: white,
                            splashColor: Colors.blueGrey,
                            elevation: 15.0,
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0/2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Alimentaire",style: TextStyle(fontSize: k, fontStyle: FontStyle.normal, color: bleu4, letterSpacing: 0.9, )),
                                //Text("     "),
                                Icon( Icons.local_dining, color: bleu4, size: p),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: largeur/n, height: hauteur/m ,
                          color: white,
                          child: RaisedButton(
                            color: white,
                            splashColor: Colors.blueGrey,
                            elevation: 15.0,
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0/2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Education",style: TextStyle(fontSize: k, fontStyle: FontStyle.normal, color: bleu4, letterSpacing: 0.9, )),
                                //Text("     "),
                                Icon( Icons.child_friendly, color: bleu4, size: p),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ),
          Container(width: largeur*0.9, height: 1.0, color: Colors.grey,),
          Container(
            width: largeur/2.3, height: hauteur- (hauteur1 + hauteur/10) ,
            color: white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: white,
                  splashColor: Colors.blueGrey,
                  elevation: 15.0,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Random Assos",style: TextStyle(fontSize: 18, fontStyle: FontStyle.normal, color: bleu4, letterSpacing: 0.9, )),
                    ],
                  ),
                  onPressed: () {},
                ),
                RaisedButton(
                  color: white,
                  splashColor: Colors.blueGrey,
                  elevation: 15.0,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Random Help",style: TextStyle(fontSize: 18, fontStyle: FontStyle.normal, color: bleu4, letterSpacing: 0.9, )),
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