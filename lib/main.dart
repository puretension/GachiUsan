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

// 블루투스 장치를 찾고 연결하는 함수
Future<BluetoothDevice?> connectToCapstone() async {
  // FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  // 스캔 시작
  FlutterBluePlus.startScan(timeout: Duration(seconds: 4));

  // 'capstone' 장치 찾기
  BluetoothDevice? capstoneDevice;
  FlutterBluePlus.scanResults.listen((results) {
    for (ScanResult r in results) {
      if (r.device.name == 'capstone') {
        capstoneDevice = r.device;
        break;
      }
    }
  });

  // // 스캔 종료
  // await FlutterBluePlus.stopScan();

  // 장치에 연결
  await capstoneDevice?.connect();

  return capstoneDevice;
}


// 'capstone' 장치에 데이터 전송하는 함수
Future<void> sendDataToCapstone(BluetoothDevice? device, String data) async {
  // 여기서는 간단히 '1'이라는 문자열을 전송하는 예제를 보여드립니다.
  // 실제로는 서비스 UUID와 특성 UUID를 알아야 합니다.

  // 연결된 장치의 서비스 찾기
  List<BluetoothService> services = await device?.discoverServices() ?? [];
  for (BluetoothService service in services) {
    // 여기서는 예시로 첫 번째 서비스를 사용합니다.
    var characteristics = service.characteristics;
    for (BluetoothCharacteristic c in characteristics) {
      // 데이터를 쓰는 특성 찾기
      // 이 부분은 장치의 특성에 따라 다를 수 있습니다.
      await c.write(data.codeUnits);

      break;
      await FlutterBluePlus.stopScan();
    }
    break;
  }
}

Future<void> initializeBluetooth() async {
  FlutterBluePlus.setLogLevel(LogLevel.verbose, color:false);

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

// listen to scan results
// Note: `onScanResults` only returns live scan results, i.e. during scanning
// Use: `scanResults` if you want live scan results *or* the previous results
  var subscription = FlutterBluePlus.onScanResults.listen((results) {
    if (results.isNotEmpty) {
      ScanResult r = results.last; // the most recently found device
      print('${r.device.remoteId}: "${r.advertisementData.advName}" found!');
    }
  },
  );

// Wait for Bluetooth enabled & permission granted
// In your real app you should use `FlutterBluePlus.adapterState.listen` to handle all states
  await FlutterBluePlus.adapterState.where((val) => val == BluetoothAdapterState.on).first;

// Start scanning
  await FlutterBluePlus.startScan();
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

  var capstoneDevice = await connectToCapstone();
  if (capstoneDevice != null) {
    await sendDataToCapstone(capstoneDevice, '1');
  }

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

// // Stop scanning
//   await FlutterBluePlus.stopScan();

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
      child: SplashScreen(),
      // child: QRScreen(),
    );
  }
}
