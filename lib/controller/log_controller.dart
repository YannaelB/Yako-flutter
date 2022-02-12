import 'package:flutter/material.dart';
import 'package:yako2/view/my_material.dart';
import 'package:yako2/util/alert_helper.dart';
import 'package:yako2/util/fire_helper.dart';
import 'package:yako2/view/my_widgets/constant.dart';
import 'package:yako2/view/my_widgets/menu2items.dart';

class LogController extends StatefulWidget {

  _LogState createState() => _LogState();
}

class _LogState extends State<LogController> {

  PageController _pageController;
  TextEditingController _mail;
  TextEditingController _pwd;
  TextEditingController _pwd2;
  TextEditingController codeAssoce;  //tout le monde ne peut pas être une Assos
  TextEditingController _name;
  TextEditingController _surname;
  TextEditingController _pseudo;
  var _currencies = ["Viewer", "Assoce"];   // choisir le genre de l'utilisateur
  var _currentItemSelected = "Viewer";  // état par défaut
  String identity;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    _mail = TextEditingController();
    _pwd = TextEditingController();
    _pwd2 = TextEditingController();
    _name = TextEditingController();
    _surname = TextEditingController();
    _pseudo = TextEditingController();
    codeAssoce = TextEditingController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _mail.dispose();
    _pwd.dispose();
    _pwd2.dispose();
    _name.dispose();
    _surname.dispose();
    _pseudo.dispose();
    codeAssoce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          //Notification received
          overscroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child: InkWell(
            onTap: (() => hideKeyboard()),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height >= 650.0) ? MediaQuery.of(context).size.height : 650.0,
                //decoration: MyGradient(startColor: Colors.teal[50], endColor: white, horizontal: false),
                decoration: BoxDecoration( gradient : LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomCenter , colors : [white, Colors.teal[300], Colors.teal[100]])),
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      PaddingWith(widget: Image(image: logoImage, height: 50.0)),
                      PaddingWith(widget: Menu2Items(item1: "Connexion", item2: "Création", pageController: _pageController), top: 20.0, bottom: 20.0,),
                      Expanded(
                        flex: 2,
                        child: PageView(
                          controller: _pageController,
                          children: <Widget>[logView(0), logView(1)],
                        ),
                      )
                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }

  Widget logView(int index) {
    if (index == 0) {
      return Column(
        children: <Widget>[
          PaddingWith(
              widget: Card(
                  elevation: 5.0,
                  color: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: listItems((index == 0)),
                    ),
                  )
              ),
              top: 15.0,
              bottom: 15.0,
              left: 20.0,
              right: 20.0
          ),
          PaddingWith(
              top: 15.0, bottom: 15.0,
              widget: ButtonGradient(callback: (() => signIn((index == 0))),
                  text: (index == 0) ? "Se connecter" : "Créer un compte")
          )
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 130.0, right: 130.0),
                  child: Container(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: DropdownButton<String>(
                        //hint: Text('select'),
                        dropdownColor: Colors.white,
                        elevation: 10,
                        icon: Icon(Icons.keyboard_arrow_down),
                        iconSize: 20.0,
                        isExpanded: true,
                        style: TextStyle(color: Colors.black, fontSize: 18,),
                        items: _currencies.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),

                          );
                        }).toList(),
                        onChanged: (String newValueSelected) {
                          //print(newValueSelected.toString());
                          //print('here');
                          setState(() {
                            this._currentItemSelected = newValueSelected;
                            //print('here:' + _currentItemSelected);
                            return identity = _currentItemSelected;
                            //print('identity:' + identity);

                          });
                        },
                        value: _currentItemSelected,
                      )))),
          PaddingWith(
              widget: Card(
                  elevation: 5.0,
                  color: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: listItems((index == 0)),
                    ),
                  )
              ),
              top: 15.0,
              bottom: 15.0,
              left: 20.0,
              right: 20.0
          ),
          // bouton d'acceptation des conditions
          PaddingWith(
              top: 15.0, bottom: 15.0,
              widget: ButtonGradient(callback: (() => signIn((index == 0))),
                  text: (index == 0) ? "Se connecter" : "Créer un compte")
          )
        ],
      );

    }
  }


  List<Widget> listItems(bool exists) {
    List<Widget> list = [];
    if (!exists) {
      list.add(MyTextField(controller: _pseudo, hint: "Entrez votre pseudo",));
      //list.add(MyTextField(controller: _name, hint: "Entrez votre nom",));  // ne pas prendre en compte, veut que surname
    }
    list.add(MyTextField(controller: _mail, hint: "Entrez votre adresse mail", type: TextInputType.emailAddress,));
    list.add(MyTextField(controller: _pwd, hint: "Entrez votre mot de passe", obscure: true,));
    if (!exists) {
      list.add(MyTextField(controller: _pwd2, hint: "vérifier votre mot de passe", obscure: true,));
    }
    if (!exists && identity == "Assoce" ) {
      list.add(MyTextField(controller: codeAssoce, hint: "code", obscure: true,));
    }
    if (identity == null || identity == "" ) {
      identity = "Viewer";
    }



    return list;
  }

  signIn(bool exists) {
    hideKeyboard();

    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (!(regExp.hasMatch(_mail.text))) {
      // So, the email is valid
      AlertHelper().error(context, "entrez un mail valide");
    }

    if (_pwd.text != _pwd2.text && !exists) {
      AlertHelper().error(context, "entrez les mêmes mots de passes");
    }


    if (_pwd.text.length < 8.0 && !exists) {
      AlertHelper().error(context, "le mot de passe doit faire au minimum 8 caractères");
    }

    if (codeAssoce.text != "195375" && !exists && identity == "Assoce") {   //mot de passe fictif le temps de trouver une autre solution pour sélectionner les Assos
      AlertHelper().error(context, "mauvais code d'inscription en tant qu'assocition");
    }

    // wrong password or mmail

    if (_mail.text != null && _mail.text != "") {
      if (_pwd.text != null && _pwd.text != "") {
        if (exists) {
          FireHelper().signIn(_mail.text, _pwd.text);
        } else {
          if (_pseudo.text != null && _pseudo.text != "" && _pseudo.text.length < 15.0) {
            if (identity != "Assoce") {
              FireHelper().createAccount(_mail.text, _pwd.text, _pseudo.text, identity);
            } else {
              FireHelper().createAccount(_mail.text, _pwd.text, _pseudo.text, identity);
            }
          } else {
            AlertHelper().error(context, " Le pseudo doit faire au maximum 15 caractères");
          }
        }
      } else {
        AlertHelper().error(context, "Aucun mot de passe");
      }
    } else {
      //Alerte Pas de mail
      AlertHelper().error(context, "Aucune adresse mail");
    }


  }

  hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

}