import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';

class PictureAvatar extends StatefulWidget {
  const PictureAvatar({super.key});

  @override
  State<PictureAvatar> createState() => _PictureAvatarState();
}

class _PictureAvatarState extends State<PictureAvatar> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (TapDownDetails details) async {
          final screenSize = MediaQuery.of(context).size;
          final offset = details.globalPosition;
          final value = await showMenu(
            color: const Color(0xFFF5F5F5),
            context: context,
            position: RelativeRect.fromLTRB(
              offset.dx,
              offset.dy,
              screenSize.width - offset.dx,
              screenSize.height - offset.dy,
            ),
            items: const [
              PopupMenuItem(value: 'remove', child: Text('Remove image')),
              PopupMenuItem(value: 'view', child: Text('View image')),
              PopupMenuItem(value: 'change', child: Text('Change image')),
            ],
          );
          if (value == 'remove') {
            // Handle remove image
          } else if (value == 'view') {
            final imagePath = _selectedImage != null
                ? _selectedImage!.path
                : 'assets/images/sell.png';

            // ignore: use_build_context_synchronously
            context.pushNamed(AppRoutes.viewImageScreen, arguments: imagePath);
          } else if (value == 'change') {
            final picker = ImagePicker();
            final pickedFile = await picker.pickImage(
              source: ImageSource.gallery,
            );

            if (pickedFile != null) {
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
                print(e.toString());
              }

              if (croppedFile != null) {
                setState(() {
                  _selectedImage = File(croppedFile!.path);
                });
              }
            }
          }
        },
        child: CircleAvatar(
          radius: 100.sp,
          backgroundColor: Colors.white,
          backgroundImage: _selectedImage != null
              ? FileImage(_selectedImage!)
              : const AssetImage('assets/images/sell.png') as ImageProvider,
        ),
      ),
    );
  }
}
