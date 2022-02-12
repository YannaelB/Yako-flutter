import 'package:flutter/material.dart';
import 'package:yako2/view/my_material.dart';


// sert à rien

class LoadingCenter extends Center {
  LoadingCenter(): super(
    child: MyText("Chargement..", fontSize: 40.0, color: baseAccent),
  );
}