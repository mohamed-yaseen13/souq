import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/di/di.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/souq_app.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  await SharedPref.init();

  // ignore: deprecated_member_use
  CloudinaryContext.cloudinary = Cloudinary.fromCloudName(
    cloudName: 'dg1wipov1',
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF5F5F5),
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(SouqApp());
}
