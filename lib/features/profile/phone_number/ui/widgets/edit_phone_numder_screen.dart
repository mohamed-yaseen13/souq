import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_button.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/core/widgets/app_text_form_field.dart';
import 'package:souq/features/profile/phone_number/data/phone_request_model.dart';
import 'package:souq/features/profile/phone_number/logic/cubit/phone_cubit.dart';
import 'package:souq/features/profile/phone_number/logic/cubit/phone_state.dart';

class EditPhoneNumderScreen extends StatefulWidget {
  const EditPhoneNumderScreen({super.key});

  @override
  State<EditPhoneNumderScreen> createState() => _EditPhoneNumderScreenState();
}

class _EditPhoneNumderScreenState extends State<EditPhoneNumderScreen> {
  late TextEditingController phoneNumberController;
  late String userPhoneNumber;
  @override
  void initState() {
    super.initState();

    userPhoneNumber = SharedPref.getUserPhoneNumber();

    phoneNumberController = TextEditingController(text: userPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      title: 'Edit Your Phone Number',
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 48.h),
        child: BlocConsumer<PhoneCubit, PhoneState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  'Edit Your Phone Number',
                  style: AppTextStyles.orangeColor32FontText,
                ),
                verticalSpace(32),
                AppTextFormField(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: phoneNumberController.text.isEmpty
                        ? Colors.grey
                        : AppColors.purple,
                    size: 25.sp,
                  ),
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
                state is PhoneLoading
                    ? CircularProgressIndicator()
                    : AppButton(
                        onPressed: () {
                          if (userPhoneNumber != phoneNumberController.text) {
                            final request = PhoneRequestModel(
                              phoneNumber: phoneNumberController.text,
                            );
                            context.read<PhoneCubit>().verifyPhoneNumber(
                              request,
                            );
                          }
                        },
                        desc: 'Verify',
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
