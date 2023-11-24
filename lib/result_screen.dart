import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:intl/intl.dart';
import 'package:mow/home_screen.dart';
import 'package:mow/login_next_button.dart';
import 'package:mow/released_screen.dart';

class ResultScreen extends StatelessWidget {
  // final BluetoothDevice device; // Reference to the connected device
  // final BluetoothCharacteristic characteristic; // Reference to the characteristic

  // const ResultScreen({super.key, required this.device, required this.characteristic});

  const ResultScreen({super.key,});

  // Future<void> _writeToCharacteristic() async {
  //   try {
  //     await characteristic.write([1]);
  //     print('Data written to characteristic');
  //   } catch (e) {
  //     print('Error writing to characteristic: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // _writeToCharacteristic();
    // 현재 시간 가져오기
    DateTime now = DateTime.now();
    // 원하는 포맷으로 시간 포맷하기 (예: 'HH시 mm분')
    String formattedTime = DateFormat('HH시 mm분').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '결제 화면',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '충무로역 - 5번 출구 (DG0123)',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Text(
              '대여 가능한 우산 : 5 / 10 개',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '대여 기간 (24시간)',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                Text(
                  '바꾸기',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '이용 금액',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '24시간 이용',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '1000원',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '보증금',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '5000원',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
              height: 30,
              width: 400,
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "보증금은 반납 후 결제 카드로 자동 반환됩니다",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/3.0,),
            Center(
              child: LoginNextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReleasedScreen(),
                    ),
                  );
                },
                buttonName: '결재하기',
                isButtonEnabled: true,
                color: Colors.black,
                width: 370,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
