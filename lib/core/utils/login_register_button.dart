import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';


class LoginRegisterButton extends StatelessWidget {
  LoginRegisterButton({Key? key, required this.text, required this.onPressed, required this.fontSize, required this.textColor, required this.fontFamily, required this.buttonColor}) : super(key: key);

  final String text;
  final Function() onPressed;
  final double fontSize;
  final Color textColor;
  final Color buttonColor;
  final String  fontFamily;




  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),),
          primary: buttonColor,

          minimumSize: Size(373.w, 57.h),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtils(
              fontFamily: fontFamily,
              text: text,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ],
        ));
  }
}



