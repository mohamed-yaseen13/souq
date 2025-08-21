import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/routing/app_routes.dart';
import 'package:souq/core/styles/app_text_styles.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/features/profile/accounts/logic/cubit/accounts_cubit.dart';
import 'package:souq/features/profile/accounts/logic/cubit/accounts_state.dart';
import 'package:souq/features/profile/accounts/ui/widgets/account_card.dart';

class UserAccounts extends StatefulWidget {
  const UserAccounts({super.key});

  @override
  State<UserAccounts> createState() => _UserAccountsState();
}

class _UserAccountsState extends State<UserAccounts> {
  @override
  void initState() {
    super.initState();
    context.read<AccountsCubit>().getUserAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      child: Center(
        child: BlocConsumer<AccountsCubit, AccountsState>(
          listener: (context, state) {
            if (state is AccountsError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state is AccountsSwitchSuccess) {
              context.pushReplacementNamed(AppRoutes.home);
            }
          },
          builder: (context, state) {
            if (state is AccountsLoading || state is AccountsSwitchLoading) {
              return CircularProgressIndicator();
            } else if (state is AccountsSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => context.pop(),
                        child: Icon(Icons.arrow_back, size: 25.sp),
                      ),
                      horizontalSpace(24),
                      Text(
                        'Your Accounts',
                        style: AppTextStyles.blackColor32FontText,
                      ),
                    ],
                  ),
                  verticalSpace(32),
                  ...state.accounts.asMap().entries.map((entry) {
                    final acc = entry.value;
                    final index = entry.key;
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: AccountCard(
                        email: acc.email,
                        name: acc.name,
                        role: acc.role,
                        isAccountHasImage: acc.isAccountHasImage,
                        accountId: acc.uid,
                        accountImageNumber: acc.accountImageNumber,
                        accountIndex: index,
                      ),
                    );
                  }),
                ],
              );
            }
            return const Center(child: Text(""));
          },
        ),
      ),
    );
  }
}
