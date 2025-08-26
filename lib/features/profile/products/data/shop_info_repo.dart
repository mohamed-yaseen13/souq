import 'dart:io';
import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
// ignore: implementation_imports
import 'package:cloudinary_api/src/request/model/uploader_params.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:souq/core/helpers/shared_pref.dart';

class ShopInfoRepo {
  final Cloudinary cloudinary;

  ShopInfoRepo({required this.cloudinary});

  Future<List<String>> uploadImages(List<File> images) async {
    List<String> urls = [];

    for (int i = 0; i < images.length; i++) {
      final response = await cloudinary.uploader().upload(
        images[i].path,
        params: UploadParams(
          publicId: "${SharedPref.getAccountId()}_$i",
          folder: "shops/${SharedPref.getAccountId()}",
          resourceType: 'image',
        ),
      );

      urls.add(response!.data!.secureUrl!);
    }

    return urls;
  }
}
