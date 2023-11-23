import 'package:flutter/material.dart';

const PRIMARY_COLOR = Color(0xFFCADEFC);
//서브 색상
const SUB_COLOR = Color(0xFFEBD7FF);
//블루 생상
const BLUE_COLOR = Color(0xFF0284C7);
//서브 블루 색상
const SUB_BLUE_COLOR = Color(0xFF53B9EE);
//배경 색상
const BACK_GROUND_COLOR = Color(0xFFFFFFFF);
//텍스트 필드 INPUT 색상
const BORDER_COLOR = Color(0xFF575757);
//텍스트 필드 커서 색상
const CURSOR_COLOR = Color(0xFF241E17);
//const BORDER_COLOR = Color(0xFF424242);
const HOME_PRIMARY_COLOR = Color(0xFF303030);





TextStyle customTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 16.0,
  color: Colors.black,
);

TextStyle customHeaderStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 28.0,
);

TextStyle InterviewTitleStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 14.5,
  color: Colors.black,
);

TextStyle greySmallTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 13.0,
  color: Colors.grey,
);


TextStyle whiteSmallTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 13.0,
  color: Colors.grey[400],
);

TextStyle blackSmallTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 13.0,
  color: Colors.black,
);

TextStyle whiteBlueTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 12.0,
  color: SUB_BLUE_COLOR,
);

TextStyle blueSmallTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 13.0,
  color: SUB_BLUE_COLOR,
);

TextStyle whiteMiddleTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 15.0,
  color: Colors.grey[800],
);


const textBrownStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.black,
  fontSize: 15,
);

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? name;
  final int? textFieldMinLine;
  final bool? enable;
  final int? maxLines; // 추가
  final bool? expands; // 추가
  final TextAlign textAlign;  // 추가
  final TextAlignVertical textAlignVertical;  // 추가

  const CustomTextFormField({
    this.textAlign = TextAlign.start,  // 기본값을 왼쪽으로 설정
    this.textAlignVertical = TextAlignVertical.top,  // 기본값을 상단으로 설정
    this.enable,
    required this.onChanged,
    this.textFieldMinLine = 1,
    this.autofocus = false,
    this.obscureText = false,
    this.errorText,
    this.hintText,
    this.controller,
    this.name,
    this.maxLines, // 추가
    this.expands, // 추가
    super.key,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showErrorText = false;

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: BORDER_COLOR,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(6.0),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 14, 6),
      child: TextFormField(
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        enabled: widget.enable ?? true,
        onTap: () {
          setState(() {
            showErrorText = false;
          });
        },
        controller: widget.controller,
        cursorColor: CURSOR_COLOR,
        obscureText: widget.obscureText,
        obscuringCharacter: '●',
        minLines: widget.expands == true ? null : widget.textFieldMinLine, // 수정된 부분
        maxLines: widget.expands == true ? null : (widget.maxLines ?? 1),
        expands: widget.expands ?? false, // 연결
        autofocus: widget.autofocus,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          fillColor: Colors.white, // 내부 색상을 흰색으로 설정
          filled: true, // 내부 색상을 적용하려면 true로 설정
          contentPadding: EdgeInsets.fromLTRB(14, 12, 14, 12),
          hintText: widget.hintText,
          errorText: widget.errorText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
          border: baseBorder,
          focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(
              color: PRIMARY_COLOR,
            ),
          ),
          enabledBorder: baseBorder,
        ),
      ),
    );
  }
}
