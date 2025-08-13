import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:souq/features/profile/picture_and_name/services/image_service.dart';

class ViewImageScreen extends StatelessWidget {
  const ViewImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView.customChild(
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        child: ImageService.getUserImage(),
      ),
    );
  }
}
