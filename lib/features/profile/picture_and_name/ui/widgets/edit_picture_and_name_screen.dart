import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/core/widgets/name_text_form_field.dart';
import 'package:souq/features/profile/picture_and_name/ui/widgets/picture_avatar.dart';

class EditPictureAndNameScreen extends StatefulWidget {
  const EditPictureAndNameScreen({super.key});

  @override
  State<EditPictureAndNameScreen> createState() =>
      _EditPictureAndNameScreenState();
}

class _EditPictureAndNameScreenState extends State<EditPictureAndNameScreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    final String username = SharedPref.getUserName();
    nameController = TextEditingController(text: username);
  }

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 64.h),
        child: Column(
          children: [
            PictureAvatar(),
            verticalSpace(64),
            NameTextFormField(nameController: nameController),
            Spacer(),
            ElevatedButton(onPressed: () {}, child: Text('Save')),
          ],
        ),
      ),
    );
  }
}
