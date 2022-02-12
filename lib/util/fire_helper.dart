//import 'package:flutter/material.dart';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yako2/models/post.dart';
import 'package:yako2/models/user.dart';
import 'package:yako2/view/my_material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yako2/util/alert_helper.dart';

class FireHelper {

  // Auth
  final auth_instance = FirebaseAuth.instance;

  Future<FirebaseUser> signIn(String mail, String pwd) async {
    try {
      final FirebaseUser user = await auth_instance.signInWithEmailAndPassword(
          email: mail, password: pwd);
      return user;
    }
    catch (e) {

      // afficher un message d'erreur si le mail ou le pseudo est déjà utilisé lors de la création d'un compte
      //afficher un message si c'est le mauvais mail/pwd lors de la connexion
      //test qui ne marche pas et je ne comprends pas pourquoi

      if (e.code == "ERROR_USER_NOT_FOUND") {
        print("Uuuuuuuuuuuuser not found");
      }
    }


  }
  Future<FirebaseUser> createAccount(String mail, String pwd, String pseudo, String identity) async {
    final FirebaseUser user = await auth_instance.createUserWithEmailAndPassword(email: mail, password: pwd);

    // Créer un utilisateur pour l'ajouter dans bdd;
    //String uid;

    String uid = user.uid;
    List<dynamic> followers = [uid];
    List<dynamic> following = [];

    List<dynamic> Emoting1 = [];  // créer des listes vides qui seront ensuite rempli lors du click des utilisateurs
    List<dynamic> Emoting2 = [];   // fonctionne sur le meme principe que les following/follower
    List<dynamic> Emoting3 = [];   // mais méthode peu optimisé, je pense qu'il y a plus simple (pub.dev : like button)
    List<dynamic> Emoting4 = [];
    List<dynamic> Emoting5 = [];
    List<dynamic> Emoter1 = [];
    List<dynamic> Emoter2 = [];
    List<dynamic> Emoter3 = [];
    List<dynamic> Emoter4 = [];
    List<dynamic> Emoter5 = [];

    Map<String, dynamic> map = {
      keyImageUrl: "",
      keyFollowers: followers,  //rajouter les compteur de like/emojy/ville/pays/..
      keyFollowing: following,
      keyUid : uid,
      keyIdentity : identity,
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
    addUser(uid,map);
    return user;
  }

  logOut() => auth_instance.signOut();

  //Database

  static final data_instance = Firestore.instance;

  final fire_user = data_instance.collection("users");

  final fire_notif = data_instance.collection("notification");

  Stream<QuerySnapshot> postsFrom(String uid) => fire_user.document(uid).collection("posts").snapshots();

  addNotification(String from, String to, String text, DocumentReference ref, String type) {
    Map<String, dynamic> map = {
      keyUid: from,
      keyText: text,
      keyType: type,
      keyRef: ref,
      keySeen: false,
      keyDate: DateTime.now().millisecondsSinceEpoch.toInt()
    };
    fire_notif.document(to).collection("singleNotif").add(map);
  }

  addUser(String uid, Map<String, dynamic> map){
    fire_user.document(uid).setData(map);
  }

  modifyPicture(File file) {      // changer la PDP, rajouter un bouton de validation comme pour la description ( alert helper et profil page
    StorageReference ref = storage_user.child(me.uid);
    addImage(file, ref).then((finalised) {
      Map<String, dynamic> data = {keyImageUrl: finalised};
      modifyUser(data);
    });
  }

  modifyUser(Map<String, dynamic> data) {
    fire_user.document(me.uid).updateData(data);
  }

  addFollow(User other) {
    if (me.following.contains(other.uid)) {
      me.ref.updateData({keyFollowing: FieldValue.arrayRemove([other.uid])});
      other.ref.updateData(({keyFollowers: FieldValue.arrayRemove([me.uid])}));
    } else {
      me.ref.updateData({keyFollowing: FieldValue.arrayUnion(([other.uid]))});
      other.ref.updateData({keyFollowers: FieldValue.arrayUnion(([me.uid]))});
    }
  }

  addLike(Post post){
    if (post.likes.contains(me.uid)) {
      post.ref.updateData({keyLikes : FieldValue.arrayRemove([me.uid])});
    } else {
      post.ref.updateData({keyLikes : FieldValue.arrayUnion([me.uid])});
      addNotification(me.uid, post.userId, "${me.pseudo} a aimé votre post", post.ref, keyLikes);
    }
  }

  // fonction pour liker/déliker les emojy d'un profil
  addEmot1(User other){
    if (me.Emoting1.contains(other.uid)) {
      me.ref.updateData({keyEmoting1: FieldValue.arrayRemove([other.uid])});
      other.ref.updateData(({keyEmoter1: FieldValue.arrayRemove([me.uid])}));
    } else {
      me.ref.updateData({keyEmoting1: FieldValue.arrayUnion(([other.uid]))});
      other.ref.updateData({keyEmoter1: FieldValue.arrayUnion(([me.uid]))});
    }
  }
  addEmot2(User other){
    if (me.Emoting2.contains(other.uid)) {
      me.ref.updateData({keyEmoting2: FieldValue.arrayRemove([other.uid])});
      other.ref.updateData(({keyEmoter2: FieldValue.arrayRemove([me.uid])}));
    } else {
      me.ref.updateData({keyEmoting2: FieldValue.arrayUnion(([other.uid]))});
      other.ref.updateData({keyEmoter2: FieldValue.arrayUnion(([me.uid]))});
    }
  }
  addEmot3(User other){
    if (me.Emoting3.contains(other.uid)) {
      me.ref.updateData({keyEmoting3: FieldValue.arrayRemove([other.uid])});
      other.ref.updateData(({keyEmoter3: FieldValue.arrayRemove([me.uid])}));
    } else {
      me.ref.updateData({keyEmoting3: FieldValue.arrayUnion(([other.uid]))});
      other.ref.updateData({keyEmoter3: FieldValue.arrayUnion(([me.uid]))});
    }
  }
  addEmot4(User other){
    if (me.Emoting4.contains(other.uid)) {
      me.ref.updateData({keyEmoting4: FieldValue.arrayRemove([other.uid])});
      other.ref.updateData(({keyEmoter4: FieldValue.arrayRemove([me.uid])}));
    } else {
      me.ref.updateData({keyEmoting4: FieldValue.arrayUnion(([other.uid]))});
      other.ref.updateData({keyEmoter4: FieldValue.arrayUnion(([me.uid]))});
    }
  }
  addEmot5(User other){
    if (me.Emoting5.contains(other.uid)) {
      me.ref.updateData({keyEmoting5: FieldValue.arrayRemove([other.uid])});
      other.ref.updateData(({keyEmoter5: FieldValue.arrayRemove([me.uid])}));
    } else {
      me.ref.updateData({keyEmoting5: FieldValue.arrayUnion(([other.uid]))});
      other.ref.updateData({keyEmoter5: FieldValue.arrayUnion(([me.uid]))});
    }
  }



  addPost(String uid, String text, File file){
    int date= DateTime.now().millisecondsSinceEpoch.toInt();
    List<dynamic> likes = [];
    List<dynamic> comments = [];
    Map< String, dynamic> map = {
      keyUid: uid,
      keyLikes: likes,
      keyComments: comments,
      keyDate: date,
    };
    if (text != null && text != "")
      map[keyText] = text;
    if (file != null ){
      StorageReference ref = storage_posts.child(uid).child(date.toString());
      addImage(file, ref).then((finalised) {
        String imageUrl = finalised;
        map[keyImageUrl] = imageUrl;
        fire_user.document(uid).collection("posts").document().setData(map);
      });
    }else{
      fire_user.document(uid).collection("posts").document().setData(map);
    }
  }

  addComment(DocumentReference ref, String text, String postOwner) {
    Map<dynamic, dynamic> map = {
      keyUid: me.uid,
      keyText: text,
      keyDate: DateTime.now().millisecondsSinceEpoch.toInt()
    };
    ref.updateData(({keyComments: FieldValue.arrayUnion([map])}));
    addNotification(me.uid, postOwner, "${me.pseudo} a commenté votre post", ref, keyComments);
  }


  //Storage

  static final storage_instance = FirebaseStorage.instance.ref();
  final storage_user = storage_instance.child("users");
  final storage_posts = storage_instance.child("posts");

  Future<String> addImage( File file, StorageReference ref) async {
    StorageUploadTask task = ref.putFile(file);
    StorageTaskSnapshot snapshot = await task.onComplete;
    String urlString = await snapshot.ref.getDownloadURL();
    return urlString;
  }
}