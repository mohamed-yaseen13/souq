import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_colors.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_container.dart';
import 'package:souq/features/profile/picture_and_name/logic/cubit/picture_and_name_cubit.dart';
import 'package:souq/features/profile/picture_and_name/logic/cubit/picture_and_name_state.dart';
import 'package:souq/features/profile/picture_and_name/services/image_service.dart';

class PictureAndNameContainer extends StatelessWidget {
  const PictureAndNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PictureAndNameCubit, PictureAndNameState>(
      builder: (context, state) {
        final String userName = SharedPref.getUserName();
        final String userRole = SharedPref.getUserRole();
        final String userEmail = SharedPref.getUserEmail();
        return AppContainer(
          height: 100,
          color: AppColors.green,
          child: InkWell(
            onTap: () {
              context.pushNamed(AppRoutes.editPictureAndNameScreen);
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40.sp,
                  backgroundColor: Colors.white,
                  child: ClipOval(child: ImageService.getUserImage()),
                ),
                horizontalSpace(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$userRole $userName',
                      style: AppTextStyles.whiteColor20FontText,
                    ),
                    verticalSpace(4),
                    Text(userEmail),
                  ],
                ),
                Spacer(),
                Icon(Icons.edit, color: Colors.white),
              ],
            ),
          ),
        );
      },
    );
  }
}
