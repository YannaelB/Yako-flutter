import 'package:flutter/material.dart';
import 'package:yako2/models/user.dart';

// User Global
User me;


//Colors
const Color white = const Color(0xFFFFFFFF);
const Color base = const Color(0xFF26C6DA);
const Color baseAccent = const Color(0xFF00796B);
const Color pointer = const Color(0xFFF44336);
const Color vert1 = const Color(0xFF1DE9B6);
const Color vert2 = const Color(0xFF69F0AE);

//const Color bleu1 = const Colors.lightBlue[700];
//const Color bleu3 = const Color(0xFFB2DFDB);
const Color bleu3 = const Color(0xFF80CBC4);
const Color bleu4 = const Color(0xFF00796B);

//Image
AssetImage logoImage = AssetImage("assets/darkBee.png");
AssetImage eventImage = AssetImage("assets/event.jpg");
AssetImage homeImage = AssetImage("assets/home.jpg");
AssetImage profileImage = AssetImage("assets/profile.jpg");

//icons
Icon homeIcon = Icon(Icons.home);
Icon friendsIcon = Icon(Icons.group);
Icon notifIcon = Icon(Icons.notifications);
Icon profilIcon = Icon(Icons.account_circle);
Icon writeIcon = Icon(Icons.border_color);
Icon sendIcon = Icon(Icons.send);
Icon camIcon = Icon(Icons.camera_enhance);
Icon libraryIcon = Icon(Icons.photo_library);
Icon likeEmpty = Icon(Icons.favorite_border);
Icon likeFull = Icon(Icons.favorite);
Icon msgIcon = Icon(Icons.message);
Icon settingsIcon = Icon(Icons.settings);
Icon workIcon = Icon(Icons.work);
Icon mapIcon = Icon(Icons.map);
Icon drapeauIcon = Icon(Icons.assistant_photo);
Icon worldvideIcon = Icon(Icons.language);
Icon world_lockIcon = Icon(Icons.vpn_lock);
Icon worldIcon = Icon(Icons.public);
Icon searchIcon = Icon(Icons.search);
Icon filIcon = Icon(Icons.all_inclusive);
Icon GalleryIcon = Icon(Icons.photo);

Icon EducationIcon = Icon(Icons.child_friendly);
Icon VoitureIcon = Icon(Icons.directions_car);
Icon fastFoodIcon = Icon(Icons.fastfood);
Icon AlimentaireIcon = Icon(Icons.local_dining);
Icon AnimalIcon = Icon(Icons.pets);
Icon NatureIcon = Icon(Icons.local_florist);
Icon FemmeIcon = Icon(Icons.wc);




//Keys
String keyName = "name";
String keySurname = "surname";
String keyImageUrl = "imageUrl";
String keyFollowers = "followers";
String keyFollowing = "following";
String keyUid = "uid";
String keyPostId = "postID";
String keyText = "text";
String keyDate = "date";
String keyLikes = "likes";

String keyEmoting1 = "Emoting1";
String keyEmoting2 = "Emoting2";
String keyEmoting3 = "Emoting3";
String keyEmoting4 = "Emoting4";
String keyEmoting5 = "Emoting5";

String keyEmoter1 = "Emoter1";
String keyEmoter2 = "Emoter2";
String keyEmoter3 = "Emoter3";
String keyEmoter4 = "Emoter4";
String keyEmoter5 = "Emoter5";


String keyComments = "comments";
String keyDescription = "description";
String keyType = "type";
String keyRef = "ref";
String keySeen = "seen";

String keyIdentity = "identity";
String keyPseudo = "pseudo";