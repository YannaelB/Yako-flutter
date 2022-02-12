import 'package:flutter/material.dart';


// Création d'une nouvelle page

class NewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(title: Text("here1"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('here2'),
        )
      ),
    );
  }
}