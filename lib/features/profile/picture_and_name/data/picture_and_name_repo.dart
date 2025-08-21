import 'dart:io';
import 'package:cloudinary_api/uploader/cloudinary_uploader.dart';
// ignore: implementation_imports
import 'package:cloudinary_api/src/request/model/uploader_params.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:nsfw_detector_flutter/nsfw_detector_flutter.dart';
import 'package:souq/core/database/database.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/features/profile/picture_and_name/data/picture_and_name_request_model.dart';

class PictureAndNameRepo {
  final Cloudinary cloudinary;
  late final NsfwDetector _nsfwDetector;

  PictureAndNameRepo({required this.cloudinary}) {
    _initNsfwDetector();
  }

  Future<void> _initNsfwDetector() async {
    _nsfwDetector = await NsfwDetector.load(threshold: 0.01);
  }

  Future<void> uploadImageToCloudinary(File imageFile) async {
    final result = await _nsfwDetector.detectNSFWFromFile(imageFile);

    if (result?.isNsfw == true) {
      print("Upload rejected: NSFW image detected.");
      throw Exception("Upload rejected: NSFW image detected.");
    }

    cloudinary.config.urlConfig.secure = true;

    final String accountId = SharedPref.getAccountId();
    final int accountImageNumber = SharedPref.getAccountImageNumber();

    final String oldPublicId = '$accountId-$accountImageNumber';
    await cloudinary.uploader().destroy(
      DestroyParams(
        publicId: oldPublicId,
        resourceType: 'image',
        invalidate: true,
      ),
    );

    await SharedPref.setAccountImageNumber(accountImageNumber + 1);

    await cloudinary.uploader().upload(
      imageFile,
      params: UploadParams(
        publicId: '$accountId-${accountImageNumber + 1}',
        uniqueFilename: false,
        overwrite: true,
        resourceType: 'image',
      ),
    );
  }

  Future<void> setImageAndNameToDatabase(
    PictureAndNameRequestModel request,
  ) async {
    if (request.imageFile != null) {
      await uploadImageToCloudinary(request.imageFile!);
      await Database.updateIsAccountHasImage(true);
    }

    if (request.name != null) {
      await Database.changeAccountName(request.name!);
    }
  }

  Future<void> deleteUserPicture() async {
    await Database.updateIsAccountHasImage(false);
    final String accountId = SharedPref.getAccountId();
    final int accountImageNumber = SharedPref.getAccountImageNumber();

    final String oldPublicId = '$accountId-$accountImageNumber';

    await cloudinary.uploader().destroy(
      DestroyParams(
        publicId: oldPublicId,
        resourceType: 'image',
        invalidate: true,
      ),
    );
  }
}
