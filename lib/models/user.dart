//import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yako2/view/my_material.dart';

class User {

  String uid;
  String name;
  String surname;

  String pseudo;
  String identity;

  String imageUrl;

  List<dynamic> followers;
  List<dynamic> following;

  List<dynamic> Emoting1;  // emojy pour evaluer les profils
  List<dynamic> Emoting2;
  List<dynamic> Emoting3;
  List<dynamic> Emoting4;
  List<dynamic> Emoting5;

  List<dynamic> Emoter1;
  List<dynamic> Emoter2;
  List<dynamic> Emoter3;
  List<dynamic> Emoter4;
  List<dynamic> Emoter5;

  DocumentReference ref;
  String documentId;
  String description;



  //User(DocumentSnapshot document);

  User(DocumentSnapshot snapshot) {
    ref = snapshot.reference;
    documentId = snapshot.documentID;
    Map<String, dynamic> map = snapshot.data;
    uid = map[keyUid];
    name = map[keyName];
    surname = map[keySurname];
    followers = map[keyFollowers];
    following = map[keyFollowing];
    imageUrl = map[keyImageUrl];
    description = map[keyDescription];

    identity = map[keyIdentity];
    pseudo = map[keyPseudo];

    Emoting1 = map[keyEmoting1];
    Emoting2 = map[keyEmoting2];
    Emoting3 = map[keyEmoting3];
    Emoting4 = map[keyEmoting4];
    Emoting5 = map[keyEmoting5];

    Emoter1 = map[keyEmoter1];
    Emoter2 = map[keyEmoter2];
    Emoter3 = map[keyEmoter3];
    Emoter4 = map[keyEmoter4];
    Emoter5 = map[keyEmoter5];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {

      keyUid: uid,
      keyName: name,
      keySurname: surname,
      keyFollowers: followers,
      keyFollowing: following,
      keyImageUrl: imageUrl,
      keyDescription: description,

      keyIdentity: identity,
      keyPseudo: pseudo,

      keyEmoting1: Emoting1,
      keyEmoting2: Emoting2,
      keyEmoting3: Emoting3,
      keyEmoting4: Emoting4,
      keyEmoting5: Emoting5,
      keyEmoter1: Emoter1,
      keyEmoter2: Emoter2,
      keyEmoter3: Emoter3,
      keyEmoter4: Emoter4,
      keyEmoter5: Emoter5,

    };
    return map;

  /*    keyUid: uid,
      keyName: name,
      keySurname: surname,
      keyFollowers: followers,
      keyFollowing: following,
      keyImageUrl: imageUrl,
      keyDescription: description,

      keyIdentity: identity,
      keyPseudo: pseudo,

      //keyEmot1: Emot1,
      keyEmot2: Emot2,
      keyEmot3: Emot3,
      keyEmot4: Emot4,
      keyEmot5: Emot5,
   */

  }
}