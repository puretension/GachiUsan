import 'package:flutter/material.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:mow/const_color.dart';
import 'package:mow/default_layout.dart';
import 'package:mow/home_screen_rented.dart';
import 'package:mow/login_next_button.dart';

class ReleasedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '잠금 해제 중...',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/img/logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(
              height: 16,
            ),
            CircularProgressIndicator(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '주의사항',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              '우산은 조심히 사용 해주세요!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.grey[600],
              ),
            ),
            Text(
              '이용 기간 내 미반납, 혹은 파손시 과태료가 부과됩니다',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 180,),
            LoginNextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreenRented(),
                  ),
                );
              },
              buttonName: '확인',
              isButtonEnabled: true,
              width: 370,
            ),
          ],
        ),
      ),
    );
  }
}
