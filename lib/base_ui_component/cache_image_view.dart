import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cacheImageView(String? imageURL) {
  return Center(child: CachedNetworkImage(
    imageUrl: imageURL ?? "",
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
  ),);
}