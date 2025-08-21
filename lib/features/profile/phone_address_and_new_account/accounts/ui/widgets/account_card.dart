import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_container.dart';
import 'package:souq/core/widgets/app_dialog.dart';
import 'package:souq/features/profile/phone_address_and_new_account/accounts/logic/cubit/accounts_cubit.dart';
import 'package:souq/core/services/image_service.dart';

class AccountCard extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final bool isAccountHasImage;
  final String accountId;
  final int accountImageNumber;
  final int accountIndex;

  const AccountCard({
    super.key,
    required this.email,
    required this.name,
    required this.role,
    required this.isAccountHasImage,
    required this.accountId,
    required this.accountImageNumber,
    required this.accountIndex,
  });

  @override
  Widget build(BuildContext context) {
    final int activeAccountIndex = SharedPref.getActiveAccountIndex();

    return AppContainer(
      height: 100,
      color: AppColors.green,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.sp,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: ImageService.getUserImage(
                  isAccountHasImage: isAccountHasImage,
                  accountId: accountId,
                  accountImageNumber: accountImageNumber,
                  userRole: role,
                ),
              ),
            ),
            horizontalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$role $name',
                  style: AppTextStyles.whiteColor20FontText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                verticalSpace(4),
                Text(email),
              ],
            ),
            horizontalSpace(8),
            if (activeAccountIndex != accountIndex)
              InkWell(
                onTap: () async {
                  final shouldLogout = await showDialog<bool>(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return AppDialog(
                        desc: 'Switch',
                        title:
                            "Are you sure you want to\nSwitch to this account?",
                      );
                    },
                  );
                  if (shouldLogout == true && context.mounted) {
                    await context.read<AccountsCubit>().switchAccount(email);
                  }
                },
                child: Icon(Icons.autorenew, size: 25.sp),
              ),
          ],
        ),
      ),
    );
  }
}
