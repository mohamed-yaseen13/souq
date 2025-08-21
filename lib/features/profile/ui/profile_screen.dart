import 'package:flutter/material.dart';
import 'package:souq/core/constants/app_constants.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_container.dart';
import 'package:souq/core/widgets/app_navigation_bar.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/features/profile/delete_account/ui/delete_account_row.dart';
import 'package:souq/features/profile/add_new_account/logout/ui/logout_row.dart';
import 'package:souq/features/profile/accounts/ui/accounts_row.dart';
import 'package:souq/features/profile/add_new_account/ui/add_account_row.dart';
import 'package:souq/features/profile/address/ui/address_row.dart';
import 'package:souq/features/profile/phone_number/ui/phone_number_row.dart';
import 'package:souq/features/profile/picture_and_name/ui/picture_and_name_container.dart';
import 'package:souq/features/profile/products/ui/products_row.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String userRole = SharedPref.getUserRole();

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
          AppContainer(child: PhoneNumberRow()),
          verticalSpace(12),
          AppContainer(child: AddressRow()),
          verticalSpace(12),
          AppContainer(child: AddAccountRow()),
          verticalSpace(12),
          AppContainer(child: AccountsRow()),
          verticalSpace(12),
          if (userRole == 'seller') AppContainer(child: ProductsRow()),
          if (userRole == 'seller') verticalSpace(12),
          AppContainer(child: LogoutRow()),
          verticalSpace(12),
          AppContainer(child: DeleteAccountRow()),
          verticalSpace(24),
        ],
      ),
    );
  }
}
