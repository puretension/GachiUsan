import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:libserialport/libserialport.dart';
import 'package:mow/home_screen.dart';
import 'package:mow/qr_screen.dart';
import 'package:mow/result_screen.dart';
import 'package:mow/splash_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


Future<void> initializeBluetooth() async {
  FlutterBluePlus.setLogLevel(LogLevel.verbose, color:false);

  if (await FlutterBluePlus.isSupported == false) {
    print("Bluetooth not supported by this device");
    return;
  }

  FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
    print(state);
  });

  if (Platform.isAndroid) {
    await FlutterBluePlus.turnOn();
  }

  await FlutterBluePlus.startScan();
  // Add additional Bluetooth setup code here if needed
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeBluetooth();
  FlutterBluePlus.setLogLevel(LogLevel.verbose, color:false);

  await NaverMapSdk.instance.initialize(
      clientId: 'z1vdqwg9dh',
      onAuthFailed: (ex) {
        print("********* 네이버맵 인증오류 : $ex *********");
      });

  /// Arduino

  // 블루투스 켜기 및 끄기
  // 참고: iOS에서는 FlutterBluePlus 메서드를 처음 호출할 때
  // " 이 앱은 Bluetooth를 사용하고 싶습니다 " 시스템 대화상자가 나타납니다.
  if (await FlutterBluePlus.isSupported == false) {
    print("Bluetooth not supported by this device");
    return;
  }

 FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
    print(state);
    if (state == BluetoothAdapterState.on) {
      // usually start scanning, connecting, etc
    } else {
      // show an error to the user, etc
    }
  });

  if (Platform.isAndroid) {
    await FlutterBluePlus.turnOn();
  }

// Wait for Bluetooth enabled & permission granted
// In your real app you should use `FlutterBluePlus.adapterState.listen` to handle all states
  await FlutterBluePlus.adapterState.where((val) => val == BluetoothAdapterState.on).first;

// Start scanning
  await FlutterBluePlus.startScan();

// Stop scanning
  await FlutterBluePlus.stopScan();

  var subscription = FlutterBluePlus.onScanResults.listen((results) {
    if (results.isNotEmpty) {
      ScanResult r = results.last; // the most recently found device
      print('${r.device.remoteId}: "${r.advertisementData.advName}" found!');
    }
  },
  );

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
    // List<String> avaiablePort = SerialPort.availablePorts;
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: HomeScreen(),
      // child: QRScreen(),
    );
  }
}
