import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mow/const_color.dart';


class LoginNextButton extends StatefulWidget {
  final String buttonName;
  final bool isButtonEnabled;
  final VoidCallback? onPressed;
  final Color? color;
  final double? width;

  const LoginNextButton({
    required this.onPressed,
    required this.buttonName,
    required this.isButtonEnabled,
    this.color,
    this.width,
    super.key,
  });

  @override
  State<LoginNextButton> createState() => _LoginNextButtonState();
}

class _LoginNextButtonState extends State<LoginNextButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: widget.width ?? 300,
      child: ElevatedButton(
        onPressed: widget.isButtonEnabled ? widget.onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color ?? Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          widget.buttonName,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


// class LoginNextButton extends StatefulWidget {
//   final String buttonName;
//   final bool isButtonEnabled;
//   final VoidCallback? onPressed;
//   final Color? color;
//
//   const LoginNextButton({
//     required this.onPressed,
//     required this.buttonName,
//     required this.isButtonEnabled,
//     this.color,
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
//       width: 400,
//       child: ElevatedButton(
//         onPressed: widget.isButtonEnabled ? widget.onPressed : null,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: widget.color ?? PRIMARY_COLOR,
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
