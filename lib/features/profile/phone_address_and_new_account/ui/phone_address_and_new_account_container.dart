import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_container.dart';
import 'package:souq/features/profile/phone_address_and_new_account/ui/widgets/add_account_row.dart';
import 'package:souq/features/profile/phone_address_and_new_account/ui/widgets/address_row.dart';
import 'package:souq/features/profile/phone_address_and_new_account/phone/ui/phone_number_row.dart';

class PhoneAddressAndNewAccountContainer extends StatelessWidget {
  const PhoneAddressAndNewAccountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 250,
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
          ],
        ),
      ),
    );
  }
}
