import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mow/const_color.dart';
import 'package:mow/default_layout.dart';
import 'package:mow/home_screen.dart';
import 'package:mow/login_next_button.dart';
import 'package:mow/qr_screen.dart';

const lat = 37.498095;
const long = 127.027610;

class HomeScreenLogined extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenLogined> {
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
                    NInfoWindow.onMarker(id: 'u1', text: '우산대여');
                marker.openInfoWindow(onMarkerInfoWindow);
              },
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF61B2E4),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 120,
              width: 300,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text(
                      "안녕하세요 이도형님!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/img/cloud.svg',
                          height: 50,
                        ),
                        const Column(
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
          Positioned(
            bottom: 120,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 70,
              width: 300,
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "남은 대여 시간 - 9시간 37분",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                    SvgPicture.asset(
                      'assets/img/length.svg',
                      height: 20,
                      color: Colors.white,
                    ),
                  ],
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
                    "현재 포인트 : 10,000원",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: LoginNextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => QRScreen(),
                  ),
                );
              },
              buttonName: '대여하기',
              isButtonEnabled: true,
              color: PRIMARY_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}

