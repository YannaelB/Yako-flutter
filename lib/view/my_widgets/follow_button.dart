import 'package:flutter/material.dart';
import 'package:yako2/util/fire_helper.dart';
import 'package:yako2/models/user.dart';
import 'package:yako2/view/my_widgets/constant.dart';
import 'package:yako2/view/my_widgets/my_text.dart';

class FollowButton extends FlatButton {



  FollowButton({ @required User user}): super(


      child: Container(

          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: bleu4,
              border: Border.all(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(10.0)),
          child: Text(me.following.contains(user.uid) ? " se désabonner" : "s'abonner", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white, letterSpacing: 0.8,)),),
    onPressed: () {
      FireHelper().addFollow(user);


  }
  );
}

