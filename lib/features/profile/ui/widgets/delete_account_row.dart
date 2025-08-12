import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class DeleteAccountRow extends StatelessWidget {
  const DeleteAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Delete Account', style: AppTextStyles.redColor20FontText),
        Spacer(),
        Icon(Icons.delete_forever, size: 32.sp, color: Colors.grey),
      ],
    );
  }
}
