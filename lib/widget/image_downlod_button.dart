// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:image_generator/service/image-download.dart';

class ImageDownload extends StatefulWidget {
  final String? imageUrl;
  final bool isGenerating;
  const ImageDownload(
      {super.key, required this.imageUrl, required this.isGenerating});

  @override
  State<ImageDownload> createState() => _ImageDownloadState();
}

class _ImageDownloadState extends State<ImageDownload> {
  bool isDownloading = false;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return isDownloading
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.white,
                  value: progress,
                ),
                Icon(
                  Icons.download,
                  size: 18,
                )
              ],
            ),
          )
        : IconButton(
            onPressed: widget.imageUrl == null || widget.isGenerating
                ? null
                : _downloadAndSaveImage,
            icon: Icon(
              Icons.download,
              size: 35,
            ),
          );
  }

  void _downloadAndSaveImage() async {
    setState(() {
      isDownloading = true;
    });
    await ImageDownloader.downloadAndSavedImage(
        widget.imageUrl!, DateTime.now().toString(),
        onProgress: (recieved, total) {
      double prog = recieved / total;
      setState(() {
        progress = prog;
      });
    });
    progress = 0;
    setState(() {
      isDownloading = false;
    });
    print('Image has been Downloaded');
  }
}
