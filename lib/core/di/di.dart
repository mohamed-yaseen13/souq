import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:souq/features/login/data/login_repo.dart';
import 'package:souq/features/login/logic/cubit/login_cubit.dart';
import 'package:souq/features/reset_password/data/reset_password_repo.dart';
import 'package:souq/features/reset_password/logic/cubit/reset_password_cubit.dart';
import 'package:souq/features/signup/data/signup_repo.dart';
import 'package:souq/features/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  getIt.registerLazySingleton<SignupRepo>(
    () => SignupRepo(
      auth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );

  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepo>()));

  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(auth: getIt<FirebaseAuth>()),
  );

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  getIt.registerLazySingleton<ResetPasswordRepo>(
    () => ResetPasswordRepo(auth: getIt<FirebaseAuth>()),
  );

  getIt.registerFactory<ResetPasswordCubit>(
    () => ResetPasswordCubit(getIt<ResetPasswordRepo>()),
  );
}
