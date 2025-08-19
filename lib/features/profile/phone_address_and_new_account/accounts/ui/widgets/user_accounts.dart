import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/features/profile/phone_address_and_new_account/accounts/logic/cubit/accounts_cubit.dart';
import 'package:souq/features/profile/phone_address_and_new_account/accounts/logic/cubit/accounts_state.dart';

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
        child: BlocBuilder<AccountsCubit, AccountsState>(
          builder: (context, state) {
            if (state is AccountsLoading) {
              return CircularProgressIndicator();
            } else if (state is AccountsError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            } else if (state is AccountsSuccess) {
              return Column(
                children: [
                  ...state.accounts.asMap().entries.map((entry) {
                    final index = entry.key;
                    final acc = entry.value;
                    return Padding(
                      padding: EdgeInsetsGeometry.symmetric(vertical: 8.h),
                      child: Column(
                        children: [
                          Text(index.toString()),
                          verticalSpace(4),
                          Text(acc.name),
                          verticalSpace(4),
                          Text(acc.email),
                        ],
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
