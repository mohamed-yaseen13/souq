import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewImageScreen extends StatelessWidget {
  final String imagePath;

  const ViewImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final isAsset = !imagePath.startsWith('/');

    return Scaffold(
      body: PhotoView(
        imageProvider: isAsset
            ? AssetImage(imagePath)
            : FileImage(File(imagePath)) as ImageProvider,
        backgroundDecoration: const BoxDecoration(color: Colors.black),
      ),
    );
  }
}
