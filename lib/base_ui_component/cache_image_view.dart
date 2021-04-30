import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_dio/ci_utility.dart';

Widget cacheImageView(String? imageURL) {
  return CachedNetworkImage(
    fit: BoxFit.fill,
    imageUrl: imageURL ?? "",
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}