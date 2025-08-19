import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_container.dart';
import 'package:souq/features/profile/phone_address_and_new_account/accounts/ui/accounts_row.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/ui/add_account_row.dart';
import 'package:souq/features/profile/phone_address_and_new_account/address/ui/address_row.dart';
import 'package:souq/features/profile/phone_address_and_new_account/phone/ui/phone_number_row.dart';

class PhoneAddressAndNewAccountContainer extends StatelessWidget {
  const PhoneAddressAndNewAccountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 305.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhoneNumberRow(),
            verticalSpace(32),
            AddressRow(),
            verticalSpace(32),
            AddAccountRow(),
            verticalSpace(32),
            AccountsRow(),
          ],
        ),
      ),
    );
  }
}
