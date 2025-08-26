// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/features/profile/picture_and_name/logic/cubit/picture_and_name_cubit.dart';
import 'package:souq/core/services/image_service.dart';

class PictureAvatar extends StatefulWidget {
  final File? initialImage;
  final ValueChanged<File?> onImageChanged;

  const PictureAvatar({
    super.key,
    this.initialImage,
    required this.onImageChanged,
  });

  @override
  State<PictureAvatar> createState() => _PictureAvatarState();
}

class _PictureAvatarState extends State<PictureAvatar> {
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.initialImage;
  }

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
            context.read<PictureAndNameCubit>().deleteUserPicture();
          } else if (value == 'view') {
            context.pushNamed(AppRoutes.viewImageScreen);
          } else if (value == 'change') {
            final newImage = await ImageService.pickAndCropImage(context);
            if (!mounted) return;
            if (newImage != null) {
              setState(() {
                _selectedImage = newImage;
              });
              widget.onImageChanged(newImage);
            }
          }
        },
        child: CircleAvatar(
          radius: 100.r,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: _selectedImage != null
                ? Image.file(_selectedImage!)
                : ImageService.getUserImage(),
          ),
        ),
      ),
    );
  }
}
