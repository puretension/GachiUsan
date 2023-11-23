import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mow/default_layout.dart';
import 'package:mow/login_next_button.dart';
import 'package:mow/login_screen.dart';
import 'package:mow/qr_screen.dart';

const lat = 37.498095;
const long = 127.027610;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NLatLng latLng = NLatLng(
    lat,
    long,
  );

  NLatLngBounds bounds = NLatLngBounds(
    southWest: NLatLng(37.413294, 126.764166),
    northEast: NLatLng(37.701749, 127.181111),
  );

  static const cameraPosition = NCameraPosition(
    target: NLatLng(lat, long),
    zoom: 15,
    bearing: 45,
    tilt: 30,
  );

  final x = Image.asset('assets/img/umbrella.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: NaverMap(
              options: const NaverMapViewOptions(
                initialCameraPosition: cameraPosition,
              ),
              onMapReady: (controller) async {
                final marker = await NMarker(
                  id: 'u1',
                  anchor: NPoint(0.5, 0.5),
                  position: const NLatLng(lat, long),
                  iconTintColor: const Color.fromARGB(235, 97, 178, 228),
                );
                final marker1 = NMarker(
                  id: 'test1',
                  position:
                      const NLatLng(37.606932467450326, 127.05578661133796),
                );
                controller.addOverlayAll({marker});

                final onMarkerInfoWindow =
                    NInfoWindow.onMarker(id: 'u1', text: '우산우산');
                marker.openInfoWindow(onMarkerInfoWindow);
              },
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF61B2E4),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 119,
                width: 300,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                     Text(
                        "이곳을 눌러 로그인하기",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/img/cloud.svg',
                            height: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "서울특별시 강남구 강남대로 지하396",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                              Text(
                                "21시까지 비가 계속될 예정이에요☔️",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 30,
              width: 300,
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text(
                    "로그인을 통해 더욱 다양한 정보를 확인할 수 있어요!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFCADEFC),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 30,
              width: 300,
              alignment: Alignment.topLeft,
              child: const Row(
                children: [
                  Text(
                    "로그인을 통해 더욱 다양한 정보를 확인할 수 있어요!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: LoginNextButton(
              onPressed: () {

              },
              buttonName: '대여하려면 로그인을 해주세요!',
              isButtonEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}

// class LoginNextButton extends StatefulWidget {
//   final String buttonName;
//   final bool isButtonEnabled;
//   final VoidCallback? onPressed;
//   final Color? color;
//   final Double? width;
//
//   const LoginNextButton({
//     required this.onPressed,
//     required this.buttonName,
//     required this.isButtonEnabled,
//     this.color,
//     this.width,
//     super.key,
//   });
//
//   @override
//   State<LoginNextButton> createState() => _LoginNextButtonState();
// }
//
// class _LoginNextButtonState extends State<LoginNextButton> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60,
//       width: widget.width ?? 300,
//       child: ElevatedButton(
//         onPressed: widget.isButtonEnabled ? widget.onPressed : null,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: widget.color ?? Colors.black,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         child: Text(
//           widget.buttonName,
//           style: TextStyle(
//             fontWeight: FontWeight.w800,
//             fontSize: 18,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
