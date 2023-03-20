import 'dart:typed_data';

import 'package:dio/dio.dart';

class ImageDownloadManager {
  static Future downloadImage(String url,
      {void Function(int recieved, int total)? onProgress}) async {
    final response = await Dio().get(url,
        options: Options(
          responseType: ResponseType.bytes,
        ),
        onReceiveProgress: onProgress);
    return Uint8List.fromList(response.data);
  }
}
