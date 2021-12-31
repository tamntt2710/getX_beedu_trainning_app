import 'package:beedu_app_training/Widget/custom_button.dart';
import 'package:beedu_app_training/const/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class LoginScreen extends StatelessWidget {
  bool _isObscure = true;
  late var shouldValidateData = false;
  TextEditingController _controller = TextEditingController();
  late final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: CustomAppBars(
          isTrue: false,
          prefixIcon: Icons.arrow_back_outlined,
          pageName: "Đăng nhập",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Center(
              child: Container(
                height: 100.h,
                child: FittedBox(child: Image.asset("assets/assets/images/logo_web.png",),
                  fit: BoxFit.cover,),
              ),
            ),
            CustomInputTextField(text : "Tài khoản",iconPrefix: Icons.account_box_sharp,),
            CustomInputTextField(text : "Mật khẩu",iconPrefix: Icons.lock,
              password:true),
            SizedBox(height : 20.h),
            CustomButton(text: "Đăng nhập",),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),

              child: RichText(
                text: TextSpan(
                  text: "Bạn chưa có tài khoản?",
                    style: textStyle,
                children: const <TextSpan>[
                    TextSpan(text: ' Đăng ký', style: TextStyle(decoration: TextDecoration.underline,fontSize: 12)),
                  ],
                ),

              ),
            ),
            Text('Quên mật khẩu?',style: textStyle,)
          ],
        ),
      ),
    );
  }
  static TextStyle textStyle = TextStyle(color: ColorConst.primaryColor,
      fontSize: 13);
}

class CustomInputTextField extends StatefulWidget {
  String? text;
  IconData? iconPrefix;
  bool? password = true;
  CustomInputTextField({this.text,this.iconPrefix,this.password});

  @override
  _CustomInputTextFieldState createState() => _CustomInputTextFieldState();
}

class _CustomInputTextFieldState extends State<CustomInputTextField> {
  bool _isObscure = true;
  late var shouldValidateData = false;
  TextEditingController _controller = TextEditingController();
  late final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal : 20.w,vertical: 10.h),
      child: TextFormField(
        focusNode: _focusNode,
        controller: _controller,
        obscureText: _isObscure,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.iconPrefix,color: ColorConst
                .green52,),
            // errorText: "Mật khẩu không được để trống",
            // errorStyle: TextStyle(color: Colors.red,fontSize: 12),
            hintText: widget.text,
            hintMaxLines: 1,
            hintStyle: TextStyle(color : Colors.grey),
             suffixIcon: widget.password == true ?IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons
                      .visibility_off,color: ColorConst.primaryColor,),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }): Container()),
      ),

    );
  }
}

