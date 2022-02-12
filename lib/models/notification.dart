import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yako2/util/date_helper.dart';
import 'package:yako2/view/my_material.dart';

class Notif {

  String text;
  String date;
  String userId;
  DocumentReference notifRef;
  DocumentReference ref;
  bool seen;
  String type;

  Notif(DocumentSnapshot snap) {
    notifRef = snap.reference;
    Map<String, dynamic> map = snap.data;
    text = map[keyText];
    date = DateHelper().myDate(map[keyDate]);
    ref = map[keyRef];
    userId = map[keyUid];
    type = map[keyType];
    seen = map[keySeen];

  }
}