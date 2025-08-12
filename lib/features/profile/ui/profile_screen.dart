import 'package:flutter/material.dart';
import 'package:souq/core/constants/app_constants.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_navigation_bar.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/features/profile/ui/widgets/delete_account_and_logout_container.dart';
import 'package:souq/features/profile/ui/widgets/phone_address_and_new_account_container.dart';
import 'package:souq/features/profile/ui/widgets/picture_and_name_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      bottomNavigationBar: AppNavigationBar(
        selectedScreen: NavigationBarEnum.profile,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Profile', style: AppTextStyles.orangeColor32FontText),
          verticalSpace(12),
          PictureAndNameContainer(),
          verticalSpace(24),
          PhoneAddressAndNewAccountContainer(),
          verticalSpace(24),
          DeleteAccountAndLogoutContainer(),
        ],
      ),
    );
  }
}
