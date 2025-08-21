import 'dart:io';

import 'package:nsfw_detector_flutter/nsfw_detector_flutter.dart';

class ReviewImages {
  static Future<void> reviewImages(File imageFile) async {
    final nsfwDetector = await NsfwDetector.load(threshold: 0.01);
    final result = await nsfwDetector.detectNSFWFromFile(imageFile);

    if (result?.isNsfw == true) {
      print("Upload rejected: NSFW image detected.");
      throw Exception("Upload rejected: NSFW image detected.");
    }
  }
}
