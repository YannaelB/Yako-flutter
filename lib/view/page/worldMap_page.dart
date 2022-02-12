import 'package:flutter/material.dart';
import 'package:yako2/view/my_material.dart';

import 'package:scalable_image/scalable_image.dart';
import 'package:show_drawer/show_drawer.dart';

// page qui s'ouvre quand clique sur l'icon de la planète dans l'appbar
// cf CdC

class WorldMap extends StatefulWidget{

  _WorldMapState createState() => _WorldMapState();

}

class _WorldMapState extends State<WorldMap> {

  /*
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      height: MediaQuery.of(context).size.height*0.9,
      //child: Container(
        //decoration: BoxDecoration(
          //color: white,
          //borderRadius: BorderRadius.only(
            //topLeft: Radius.circular(20.0),
            //topRight: Radius.circular(20.0),
          //),
        //),
        child: Container(
          decoration: MyGradient(startColor: baseAccent, endColor: base, radius: 0.0, horizontal: true),
          child: PaddingWith(widget: Image(image: logoImage, height: 100.0 )),
        //),
        )
    );
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: white,
      height: MediaQuery.of(context).size.height*0.85,
      child: Scaffold(
        body: new Container(
          width: MediaQuery.of(context).size.width*2,
          height: MediaQuery.of(context).size.height*0.3,
          alignment: Alignment.center,
          child: new ScalableImage(
            imageProvider: new AssetImage('assets/map1.jpg'),
            dragSpeed: 8.0,
            maxScale: 16.0,
            wrapInAspect: false,
            enableScaling: true,
          ),
        ),
      ),


    );
  }
}




// si arrive pas à faire la carte, faire un bouton liste et annoncer la carte bientot disponible