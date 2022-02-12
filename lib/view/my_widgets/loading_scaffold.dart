import 'package:flutter/material.dart';
import 'Loading_Center.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yako2/view/my_widgets/constant.dart';


// fonction qui met un petit rond lors du chargement

class LoadingScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: white,
      body:    // SafeArea(child: LoadingCenter()),// ne pas avoir de appBar
      Center(child: SpinKitFadingCircle(
        color: bleu4,
        size: 80.0,
      ),),
    );
  }
}