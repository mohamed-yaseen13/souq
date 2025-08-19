import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_text_styles.dart';

class AccountsRow extends StatelessWidget {
  const AccountsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.userAccounts);
      },
      child: Row(
        children: [
          Text('Your Accounts', style: AppTextStyles.blackColor18FontText),
          Spacer(),
          Icon(Icons.keyboard_arrow_right, size: 32.sp, color: Colors.grey),
        ],
      ),
    );
  }
}
