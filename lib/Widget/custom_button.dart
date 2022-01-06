import 'package:beedu_app_training/const/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButton extends StatelessWidget {
  String? text;
  double? heightButton;
  double? widthButton;
  VoidCallback onTap;
  CustomButton({this.text,this.heightButton,this.widthButton,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: heightButton != null ? heightButton : 50.h,
          width: widthButton != null ?  widthButton : 140.w ,
          decoration: BoxDecoration(
            color: ColorConst.primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(text!,style: TextStyle(color: Colors
                .white,),),
          ),
        ),
      ),
    );
  }
}