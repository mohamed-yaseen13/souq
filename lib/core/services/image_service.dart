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

  static Widget getUserImage({
    bool? isAccountHasImage,
    String? accountId,
    int? accountImageNumber,
    String? userRole,
  }) {
    final bool _isAccountHasImage =
        isAccountHasImage ?? SharedPref.getUserImage();

    if (_isAccountHasImage) {
      final String _accountId = accountId ?? SharedPref.getAccountId();
      final int _accountImageNumber =
          accountImageNumber ?? SharedPref.getAccountImageNumber();

      return CldImageWidget(publicId: '$_accountId-$_accountImageNumber');
    } else {
      final String _userRole = userRole ?? SharedPref.getUserRole();
      final roleEnum = _userRole.toRole();
      return Image.asset(roleEnum.imagePath);
    }
  }
}
