import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/widgets/app_container.dart';
import 'package:souq/features/profile/delete_account_and_logout/delete_account/ui/delete_account_row.dart';
import 'package:souq/features/profile/delete_account_and_logout/logout/ui/logout_row.dart';

class DeleteAccountAndLogoutContainer extends StatelessWidget {
  const DeleteAccountAndLogoutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 140,
      color: AppColors.orange,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [LogoutRow(), verticalSpace(24), DeleteAccountRow()],
        ),
      ),
    );
  }
}
