// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  const MyCachedNetworkImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl!,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        var progress = downloadProgress.progress ?? 0;
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: LinearProgressIndicator(
                  minHeight: 30,
                  color: Colors.white,
                  value: progress,
                ),
              ),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            )
          ],
        );
      },
    );
  }
}
