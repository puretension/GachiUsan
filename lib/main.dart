import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mow/home_screen.dart';
import 'package:mow/qr_screen.dart';
import 'package:mow/result_screen.dart';
import 'package:mow/splash_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// MaterialApp(home: MyApp()
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
      clientId: 'z1vdqwg9dh',
      onAuthFailed: (ex) {
        print("********* 네이버맵 인증오류 : $ex *********");
      });
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Suite',
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: HomeScreen(),
    );
  }
}
