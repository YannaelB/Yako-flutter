import 'package:flutter/material.dart';
import 'package:yako2/util/fire_helper.dart';
import 'package:yako2/view/my_material.dart';
import 'package:yako2/models/user.dart';
import 'package:yako2/models/post.dart';
import 'package:yako2/view/page/detail_page.dart';

class DetailPost extends StatelessWidget {

  User user;
  Post post;

  DetailPost(this.post, this.user);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: base,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child: InkWell(child: DetailPage(post, user), onTap: (){
              FocusScope.of(context).requestFocus(FocusNode());
            },)),
            Container(width: MediaQuery.of(context).size.width, height: 1.0, color: baseAccent),
            Container(width: MediaQuery.of(context).size.width, height: 75.0, color: base,
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(width: MediaQuery.of(context).size.width - 100.0,
                    child: MyTextField(controller: controller, hint: "Ecrivez un commentaire",),
                  ),
                  IconButton(icon: sendIcon, onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (controller.text != null && controller.text != "") {
                      FireHelper().addComment(post.ref, controller.text, post.userId);
                    }
                  },)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}