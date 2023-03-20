// ignore_for_file: file_names
import 'package:image_generator/service/image_download_manager.dart';
import 'package:image_generator/service/image_save_manager.dart';

class ImageDownloader {
  static Future<void> downloadAndSavedImage(
    String url,
    String fileName, {
    void Function(int recieved, int total)? onProgress,
  }) async {
    try {
      final imageData =
          await ImageDownloadManager.downloadImage(url, onProgress: onProgress);
      await ImageSavedmanager.saveImage(imageData, fileName);
    } catch (e) {
      print(e);
    }
  }
}
