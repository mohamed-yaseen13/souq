import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/core/widgets/app_text_form_field.dart';

class EditPhoneNumderScreen extends StatefulWidget {
  const EditPhoneNumderScreen({super.key});

  @override
  State<EditPhoneNumderScreen> createState() => _EditPhoneNumderScreenState();
}

class _EditPhoneNumderScreenState extends State<EditPhoneNumderScreen> {
  late TextEditingController phoneNumberController;
  @override
  void initState() {
    super.initState();

    final String userPhoneNumber = SharedPref.getUserPhoneNumber();

    phoneNumberController = TextEditingController(text: userPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 48.h),
        child: Column(
          children: [
            Text(
              'Edit Your Phone Number',
              style: AppTextStyles.orangeColor32FontText,
            ),
            verticalSpace(32),
            AppTextFormField(
              controller: phoneNumberController,
              label: 'Phone Number',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Your Phone Number';
                }
                if (value.length < 11) {
                  return 'Please Enter a Valid Phone Number';
                }
                return null;
              },
            ),
            Spacer(),
            ElevatedButton(onPressed: () {}, child: Text('Verify')),
          ],
        ),
      ),
    );
  }
}
