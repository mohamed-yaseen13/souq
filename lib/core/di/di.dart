import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:souq/features/login/data/login_repo.dart';
import 'package:souq/features/login/logic/cubit/login_cubit.dart';
import 'package:souq/features/on_boarding/data/role_selection_repo.dart';
import 'package:souq/features/on_boarding/logic/cubit/role_selection_cubit.dart';
import 'package:souq/features/reset_password/data/reset_password_repo.dart';
import 'package:souq/features/reset_password/logic/cubit/reset_password_cubit.dart';
import 'package:souq/features/signup/data/signup_repo.dart';
import 'package:souq/features/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //firebase auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  //firebase firestore
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  //sign up
  getIt.registerLazySingleton<SignupRepo>(
    () => SignupRepo(
      auth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepo>()));

  //login
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(
      auth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
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
  getIt.registerLazySingleton<RoleSelectionRepo>(
    () => RoleSelectionRepo(firestore: getIt<FirebaseFirestore>()),
  );
  getIt.registerFactory<RoleSelectionCubit>(
    () => RoleSelectionCubit(getIt<RoleSelectionRepo>()),
  );
}
