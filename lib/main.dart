import 'package:firebase_core/firebase_core.dart';
import 'package:flaunt_ecommenrce/dependency/shared_pref.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/on_board_control_home.dart';
import 'package:flaunt_ecommenrce/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flaunt',
              theme: ThemeData(
                fontFamily: 'Oswald',
                primarySwatch: Colors.blue,
              ),
              home: SplashScreen());
        });
  }
}
