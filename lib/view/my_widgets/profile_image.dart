import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yako2/view/my_material.dart';

class ProfileImage extends InkWell {

  ProfileImage({double size: 14.0, @required String urlString, @required VoidCallback onPressed}): super(
    onTap: onPressed,
    child: CircleAvatar(
      radius: size,
      backgroundImage: (urlString != null && urlString != "") ? CachedNetworkImageProvider(urlString) : logoImage,  // remplacer par un avatar
      backgroundColor: white,
    )
  );
}