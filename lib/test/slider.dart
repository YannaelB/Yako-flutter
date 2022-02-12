import 'package:flutter/material.dart';
import 'package:yako2/view/my_material.dart';



// page du début pour présenter l'application.
//cf CdC pour résoudre le problème


class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SliderPage({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PaddingWith(widget: Image(image: logoImage, height: 100.0 )),
          SizedBox(height: 60,),
          Text(title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                letterSpacing: 0.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}

class SliderPage2 extends StatelessWidget {

  final String title;
  final String description;
  final String image;

  SliderPage2({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PaddingWith(widget: Image(image: logoImage, height: 100.0 )),
          SizedBox(height: 60,),
          Text(title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                letterSpacing: 0.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 60,),
        ],
      ),
    );
  }
}