import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:souq/features/auth/login/data/login_repo.dart';
import 'package:souq/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:souq/features/on_boarding/data/role_selection_repo.dart';
import 'package:souq/features/on_boarding/logic/cubit/role_selection_cubit.dart';
import 'package:souq/features/auth/signup/data/signup_repo.dart';
import 'package:souq/features/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:souq/features/profile/delete_account_and_logout/delete_account/data/delete_account_repo.dart';
import 'package:souq/features/profile/delete_account_and_logout/delete_account/logic/cubit/delete_account_cubit.dart';
import 'package:souq/features/profile/delete_account_and_logout/logout/data/logout_repo.dart';
import 'package:souq/features/profile/delete_account_and_logout/logout/logic/cubit/logout_cubit.dart';
import 'package:souq/features/profile/phone_address_and_new_account/accounts/data/account_repo.dart';
import 'package:souq/features/profile/phone_address_and_new_account/accounts/logic/cubit/accounts_cubit.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/data/add_account_repo.dart';
import 'package:souq/features/profile/phone_address_and_new_account/add_new_account/logic/cubit/add_account_cubit.dart';
import 'package:souq/features/profile/phone_address_and_new_account/phone/data/phone_repo.dart';
import 'package:souq/features/profile/phone_address_and_new_account/phone/logic/cubit/phone_cubit.dart';
import 'package:souq/features/profile/picture_and_name/data/picture_and_name_repo.dart';
import 'package:souq/features/profile/picture_and_name/logic/cubit/picture_and_name_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //firebase auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  //sign up
  getIt.registerLazySingleton<SignupRepo>(
    () => SignupRepo(auth: getIt<FirebaseAuth>()),
  );
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepo>()));

  //login
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(auth: getIt<FirebaseAuth>()),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  //role selection
  getIt.registerLazySingleton<RoleSelectionRepo>(() => RoleSelectionRepo());

  getIt.registerFactory<RoleSelectionCubit>(
    () => RoleSelectionCubit(getIt<RoleSelectionRepo>()),
  );

  // cloudinary object
  getIt.registerLazySingleton<Cloudinary>(
    () => Cloudinary.fromStringUrl(
      'cloudinary://389364851217256:cbBpwEs-4RrWns10zx0Gj3bXO3w@dg1wipov1',
    ),
  );

  getIt.registerLazySingleton<PictureAndNameRepo>(
    () => PictureAndNameRepo(cloudinary: getIt<Cloudinary>()),
  );

  getIt.registerFactory<PictureAndNameCubit>(
    () => PictureAndNameCubit(getIt<PictureAndNameRepo>()),
  );

  // phone
  getIt.registerLazySingleton<PhoneRepo>(
    () => PhoneRepo(auth: getIt<FirebaseAuth>()),
  );

  getIt.registerFactory<PhoneCubit>(() => PhoneCubit(getIt<PhoneRepo>()));

  // add new account
  getIt.registerLazySingleton<AddAccountRepo>(
    () => AddAccountRepo(auth: getIt<FirebaseAuth>()),
  );

  getIt.registerFactory<AddAccountCubit>(
    () => AddAccountCubit(getIt<AddAccountRepo>()),
  );

  // user accounts
  getIt.registerLazySingleton<AccountRepo>(() => AccountRepo());

  getIt.registerFactory<AccountsCubit>(
    () => AccountsCubit(getIt<AccountRepo>()),
  );

  // logout
  getIt.registerLazySingleton<LogoutRepo>(
    () => LogoutRepo(auth: getIt<FirebaseAuth>()),
  );

  getIt.registerFactory<LogoutCubit>(() => LogoutCubit(getIt<LogoutRepo>()));

  // delete account
  getIt.registerLazySingleton<DeleteAccountRepo>(
    () => DeleteAccountRepo(auth: getIt<FirebaseAuth>()),
  );

  getIt.registerFactory<DeleteAccountCubit>(
    () => DeleteAccountCubit(getIt<DeleteAccountRepo>()),
  );
}
