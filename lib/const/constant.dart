import 'package:flutter/material.dart';

class ColorConst{
  static const Color green38 = Color(0xff389E0D);
  static const Color green73 = Color(0xff73D13D);
  static const Color greenF6 = Color(0xffF6FFED);
  static const Color green52 = Color(0xff52C41A);
  static const Color green64 = Color(0xff95DE64);
  static const Color primaryColor = Color(0xff52C41A);
  static const textStyleAppBar = TextStyle(color: ColorConst.primaryColor,
      fontSize: 18);
  static const Color textFieldFocusColor = Color(0xff2050F6);
  static const Color textFieldHelperColor = Color(0xff666666);

  static const Color buttonDisabledColor = Color(0xff21242A);
  static const Color buttonTextColor = Colors.white;

  static const Color roundTokenShadowColor = Color(0xff200e32);
  static const Color accountSettingIconBackground = Color(0xffFAFAFA);

  static Color colorFromHex(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }

  static const Color colorTextSubTitle = Color(0xff999999);
  static const Color colorTextTitleMethod = Color(0xffECECEC);
  static const Color colorBackgroundAuthenticationMethod = Color(0xFF21242A);
  static const Color colorBackgroundIconHistory = Color(0xfff0eff5);
  static const Color colorLightGray = Color(0xffD2D0CE);
  static const Color colorTextPlaceholder = Color(0xffA19F9D);
  static const Color colorAppError = Color(0xFFCF202F);
  static TextStyle styleTextHelperTextField= TextStyle(
    color: ColorConst.textFieldHelperColor,
    fontSize: 12,
 //   fontWeight: fontWeightRegular,
  );
  static TextStyle styleTextInputError = TextStyle(
    color: ColorConst.colorAppError,
    fontSize: 12,
 //   fontWeight: fontWeightRegular,

  );
  static const String iconEyeOpen = "assets/assets/images/ic_eye_open.svg";
  static const String iconEyeClose = "assets/assets/images/ic_eye_close.svg";

}