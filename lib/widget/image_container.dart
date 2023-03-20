// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:image_generator/service/network_image.dart';

class ImageContainer extends StatelessWidget {
  final String? _imageUrl;
  final bool isGenerating;
  const ImageContainer(
      {super.key, required String? imageUrl, required this.isGenerating})
      : _imageUrl = imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.white70,
              offset: Offset(0, 2),
              spreadRadius: 1,
              blurRadius: 4)
        ], color: Colors.white),
        child: isGenerating
            ? Center(
                child: Text(
                'Image is being generated',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ))
            : _imageUrl == null
                ? Center(
                    child: Text(
                    'Input a description to generate an image',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ))
                : MyCachedNetworkImage(imageUrl: _imageUrl));
  }
}
