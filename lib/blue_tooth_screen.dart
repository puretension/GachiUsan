// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
//
// class BluetoothScreen extends StatefulWidget {
//   @override
//   _BluetoothScreenState createState() => _BluetoothScreenState();
// }
//
// class _BluetoothScreenState extends State<BluetoothScreen> {
//   FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
//   List<BluetoothDevice> connectedDevices = [];
//   bool isScanning = false;
//   List<ScanResult> scanResults = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // TODO: Connect to previously connected device (if any)
//     getConnectedDevice();
//   }
//
//   void getConnectedDevice() async {
//     connectedDevices = await flutterBlue.connectedDevices;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Bluetooth Screen'),
//       ),
//       body: Column(
//         children: [
//           Flexible(
//             flex: 1,
//             child: ConnectedDevices(),
//           ),
//           Flexible(
//             flex: 4,
//             child: ScanningDevices(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget ConnectedDevices() {
//     return Column(
//       children: [
//         Container(
//           alignment: Alignment.centerLeft,
//           child: const Text(
//             'Connected Devices',
//             style: TextStyle(
//                 color: Colors.Blue[300],
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700),
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: connectedDevices.length,
//             itemBuilder: (context, index) {
//               var connectedDevice = connectedDevices[index];
//               return Container(
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
//                 height: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.lightBlue[100],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.bluetooth),
//                     const SizedBox(width: 8),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           connectedDevice!.name,
//                           style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           'ID : [${connectedDevice!.id.toString()}]',
//                           style: const TextStyle(
//                             fontSize: 10,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Column(
//                       children: [
//                         ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.lightBlue[50]),
//                           ),
//                           onPressed: () {
//                             // TODO: Connect to selected device
//                             print('ID [ ${connectedDevice!.id}]');
//                             print('Name [ ${connectedDevice!.name}]');
//                             connectedDevice!.disconnect();
//                             setState(() {
//                               connectedDevices.remove(connectedDevice);
//                             });
//                           },
//                           child: const Text('disConnect'),
//                         ),
//                         ElevatedButton(
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all(
//                                 Colors.orangeAccent[700]),
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       DeviceScreen(device: connectedDevice)),
//                             );
//                           },
//                           child: const Text('Device..'),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget ScanningDevices() {
//     return Column(
//       children: [
//         Row(
//           children: [
//             ElevatedButton(
//               onPressed: isScanning ? null : startScan,
//               child: Text(isScanning ? 'Scanning...' : 'Scan'),
//             ),
//             ElevatedButton(
//               onPressed: stopScan,
//               child: Text('Stop!'),
//             ),
//           ],
//         ),
//         Container(
//           alignment: Alignment.centerLeft,
//           child: const Text(
//             'Scanning Devices',
//             style: TextStyle(
//               color: Colors.blue,
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         Expanded(
//           child: RefreshIndicator(
//             onRefresh: () => stopScan().then((_) => startScan()),
//             child: ListView.builder(
//               itemCount: scanResults.length,
//               itemBuilder: (BuildContext context, int index) {
//                 var scanResult = scanResults[index];
//                 if (scanResult.device.name.isNotEmpty) {
//                   return Container(
//                     margin: const EdgeInsets.symmetric(
//                         horizontal: 5.0, vertical: 5.0),
//                     height: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.grey[200],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(Icons.bluetooth),
//                         const SizedBox(width: 8),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               scanResult.device.name,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               'ID : [${scanResult.device.id.toString()}]',
//                               style: const TextStyle(
//                                 fontSize: 10,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         ElevatedButton(
//                           style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all(
//                                   Colors.lightBlue[50]),
//                               foregroundColor:
//                                   MaterialStateProperty.all(Colors.black)),
//                           onPressed: () {
//                             // TODO: Connect to selected device
//                             scanResult.device.connect();
//                             print('ID [ ${scanResult.device.id}]');
//                             print('Name [ ${scanResult.device.name}]');
//
//                             setState(() {
//                               scanResults.remove(scanResult.device);
//                               connectedDevices.add(scanResult.device);
//                             });
//                           },
//                           child: const Text('Connect'),
//                         ),
//                       ],
//                     ),
//                   );
//                 } else {
//                   return Container();
//                 }
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   void startScan() async {
//     setState(() {
//       isScanning = true;
//       scanResults.clear();
//     });
//     try {
//       flutterBlue.scan().listen((scanResult) {
//         setState(() {
//           scanResults.add(scanResult);
//         });
//       });
//     } catch (e) {
//       print('error : ${e.toString()}');
//     }
//   }
//
//   Future<void> stopScan() async {
//     setState(() {
//       isScanning = false;
//     });
//     await flutterBlue.stopScan();
//   }
// }



// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// void main() {
//   FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);
//   runApp(const FlutterBlueApp());
// }
//
// class FlutterBlueApp extends StatefulWidget {
//   const FlutterBlueApp({Key? key}) : super(key: key);
//
//   @override
//   State<FlutterBlueApp> createState() => _FlutterBlueAppState();
// }
//
// class _FlutterBlueAppState extends State<FlutterBlueApp> {
//   BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;
//
//   late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;
//
//   @override
//   void initState() {
//     super.initState();
//     _adapterStateStateSubscription = FlutterBluePlus.adapterState.listen((state) {
//       _adapterState = state;
//       setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     _adapterStateStateSubscription.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget screen = _adapterState == BluetoothAdapterState.on
//         ? const ScanScreen()
//         : BluetoothOffScreen(adapterState: _adapterState);
//
//     return MaterialApp(
//       color: Colors.lightBlue,
//       home: screen,
//       navigatorObservers: [BluetoothAdapterStateObserver()],
//     );
//   }
// }
//
// class BluetoothAdapterStateObserver extends NavigatorObserver {
//   StreamSubscription<BluetoothAdapterState>? _adapterStateSubscription;
//
//   @override
//   void didPush(Route route, Route? previousRoute) {
//     super.didPush(route, previousRoute);
//     if (route.settings.name == '/DeviceScreen') {
//       // Start listening to Bluetooth state changes when a new route is pushed
//       _adapterStateSubscription ??= FlutterBluePlus.adapterState.listen((state) {
//         if (state != BluetoothAdapterState.on) {
//           // Pop the current route if Bluetooth is off
//           navigator?.pop();
//         }
//       });
//     }
//   }
//
//   @override
//   void didPop(Route route, Route? previousRoute) {
//     super.didPop(route, previousRoute);
//     // Cancel the subscription when the route is popped
//     _adapterStateSubscription?.cancel();
//     _adapterStateSubscription = null;
//   }
// }