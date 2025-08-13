import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:souq/features/auth/login/data/login_repo.dart';
import 'package:souq/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:souq/features/auth/on_boarding/data/role_selection_repo.dart';
import 'package:souq/features/auth/on_boarding/logic/cubit/role_selection_cubit.dart';
import 'package:souq/features/auth/reset_password/data/reset_password_repo.dart';
import 'package:souq/features/auth/reset_password/logic/cubit/reset_password_cubit.dart';
import 'package:souq/features/auth/signup/data/signup_repo.dart';
import 'package:souq/features/auth/signup/logic/cubit/signup_cubit.dart';
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

  //reset password
  getIt.registerLazySingleton<ResetPasswordRepo>(
    () => ResetPasswordRepo(auth: getIt<FirebaseAuth>()),
  );
  getIt.registerFactory<ResetPasswordCubit>(
    () => ResetPasswordCubit(getIt<ResetPasswordRepo>()),
  );

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
}
