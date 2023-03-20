// ignore_for_file: prefer_const_constructors, empty_catches

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final openAI = OpenAI.instance.build(
    //api key
    token: "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",
    baseOption: HttpSetup(receiveTimeout: Duration(seconds: 20)),
    isLog: true,
  );

  Future<ImageUrl?> generateImage(String prompt) async {
    try {
      final request = GenerateImage(prompt, 1, size: ImageSize.size1024);
      final getImageResponse = await openAI.generateImage(request);
      final listImageData = getImageResponse?.data;
      final imageData = listImageData?.last;
      return imageData?.url;
    } catch (e) {
      print(e);
    }
    return null;
  }

  void dispose() {
    openAI.genImgClose();
  }
}

typedef ImageUrl = String;
