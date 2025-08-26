import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_button.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/core/widgets/app_text_form_field.dart';
import 'package:souq/core/widgets/name_text_form_field.dart';
import 'package:souq/features/profile/products/ui/widgets/image_section.dart';

class EditShopInfoScreen extends StatefulWidget {
  const EditShopInfoScreen({super.key});

  @override
  State<EditShopInfoScreen> createState() => _EditShopInfoScreenState();
}

class _EditShopInfoScreenState extends State<EditShopInfoScreen> {
  final _picker = ImagePicker();
  List<File> _selectedImages = [];
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      title: 'Edit Shop Your Info',
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ImageSection(
              desc: 'Shop',
              selectedImages: _selectedImages,
              onTap: _pickImages,
            ),
            verticalSpace(24),
            NameTextFormField(nameController: _nameController),
            verticalSpace(24),
            AppTextFormField(
              controller: _bioController,
              label: 'Bio',
              placeholder: 'Describe your Shop in detail...',
              maxLines: 4,
            ),
            verticalSpace(64),
            AppButton(desc: 'Save', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImages() async {
    final List<XFile> images = await _picker.pickMultiImage(
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );

    if (images.isNotEmpty && images.length <= 10) {
      setState(() {
        _selectedImages = images.map((xFile) => File(xFile.path)).toList();
      });
    } else if (images.length > 10 && context.mounted) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You can only select up to 10 images'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
