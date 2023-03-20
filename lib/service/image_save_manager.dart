import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:typed_data';

class ImageSavedmanager {
  static Future<void> saveImage(Uint8List imageData, String fileName) async {
    await ImageGallerySaver.saveImage(imageData, quality: 80, name: fileName);
  }
}
