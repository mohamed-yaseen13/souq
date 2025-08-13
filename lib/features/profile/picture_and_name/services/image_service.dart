import 'dart:io';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/shared_pref.dart';

class ImageService {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickAndCropImage(BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return null;

    CroppedFile? croppedFile;
    try {
      croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.red,
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: true,
            cropStyle: CropStyle.circle,
          ),
          IOSUiSettings(title: 'Crop Image'),
        ],
      );
    } catch (e) {
      debugPrint("Image cropper error: $e");
      return null;
    }

    if (croppedFile == null) return null;

    return File(croppedFile.path.replaceFirst('file://', ''));
  }

  static Widget getUserImage() {
    final bool isUserHasImage = SharedPref.getUserImage();

    if (isUserHasImage) {
      final String userId = SharedPref.getUserId();
      final int userPictureNumber = SharedPref.getUserPictureNumber();

      return CldImageWidget(publicId: '$userId-$userPictureNumber');
    } else {
      final String userRole = SharedPref.getUserRole();
      final roleEnum = userRole.toRole();
      return Image.asset(roleEnum.imagePath);
    }
  }
}
