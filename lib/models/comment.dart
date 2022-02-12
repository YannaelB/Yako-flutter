import 'package:yako2/view/my_material.dart';
import 'package:yako2/util/date_helper.dart';

class Comment {

  String userId;
  String text;
  String date;

  Comment(Map<dynamic, dynamic> map)  {
    userId = map[keyUid];
    text = map[keyText];
    date = DateHelper().myDate(map[keyDate]);
  }
}