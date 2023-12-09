import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mow/const_color.dart';
import 'package:mow/home_screen_logined.dart';
import 'package:mow/login_next_button.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('로그인',style: TextStyle(fontWeight: FontWeight.w800),)), // AppBar 추가
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenUtil().setHeight(40)),
            Text('이메일',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
            CustomTextFormField(
              controller: _emailController,
              hintText: 'email@email.com',
              onChanged: (String value) {},
            ),
            SizedBox(height: 10),
            Text('비밀번호',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
            CustomTextFormField(
              controller: _passwordController,
              hintText: '6자 이상의 영문/숫자 조합',
              onChanged: (String value) {},
              obscureText: true,
            ),
            SizedBox(height: 20),
            LoginNextButton(
              buttonName: '로그인',
              isButtonEnabled: true,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreenLogined()),
                );
              },
              color: Colors.black,
              width: 370,
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
