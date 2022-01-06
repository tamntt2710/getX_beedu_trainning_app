import 'package:beedu_app_training/Controller/sign_in_controller.dart';
import 'package:beedu_app_training/Provider/sign_in_provider.dart';
import 'package:beedu_app_training/Widget/custom_button.dart';
import 'package:beedu_app_training/const/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../main.dart';
const SERVER_IP = 'https://dongythientrithuc.vn/api';
class LoginScreen extends GetView<SignInController> {
  late var shouldValidateData = false;
  TextEditingController _controllerUser = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  late final FocusNode _focusNode = FocusNode();
  final storage = FlutterSecureStorage();

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
            CustomInputTextField(text : "Tài khoản",iconPrefix: Icons
                .account_box_sharp,password:false,controller: _controllerUser,),
            CustomInputTextField(text : "Mật khẩu",iconPrefix: Icons.lock,
              password:true,controller: _controllerPass,),
            SizedBox(height : 20.h),
            CustomButton(text: "Đăng nhập",
            onTap: () async {
              var username = _controllerUser.text;
              var password = _controllerPass.text;
              var jwt = await attemptLogIn(username, password);
              if (jwt != null) {
                print(jwt);
                storage.write(key: "jwt", value: jwt);
                print("login success!");

              } else {
                print("Error : $jwt");

              }

            }
            ),
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

  Future<String?> attemptLogIn(String username, String password) async {
    print("waiting .... ");
    var res = await post(
        Uri.parse('$SERVER_IP/auth/login'),
        body: {
          "username": username,
          "password": password
        }
    );
    if(res.statusCode == 200) return res.body;
    else
      print(res.statusCode );
    return null;
  }

}

class CustomInputTextField extends StatefulWidget {
  String? text;
  IconData? iconPrefix;
  bool? password = true;
  TextEditingController controller = TextEditingController();
  CustomInputTextField({this.text,this.iconPrefix,this.password,required this.controller});

  @override
  _CustomInputTextFieldState createState() => _CustomInputTextFieldState();
}

class _CustomInputTextFieldState extends State<CustomInputTextField> {
  bool _isObscure = true;
  late var shouldValidateData = false;
  late final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal : 20.w,vertical: 10.h),
      child: widget.password == true ? TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        obscureText: _isObscure,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.iconPrefix,color: ColorConst
                .green52,),
            // errorText: "Mật khẩu không được để trống",
            // errorStyle: TextStyle(color: Colors.red,fontSize: 12),
            hintText: widget.text,
            hintMaxLines: 1,
            hintStyle: TextStyle(color : Colors.grey),
             suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons
                      .visibility_off,color: ColorConst.primaryColor,),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                })),
      ) : TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.iconPrefix,color: ColorConst
                .green52,),
            // errorText: "Mật khẩu không được để trống",
            // errorStyle: TextStyle(color: Colors.red,fontSize: 12),
            hintText: widget.text,
            hintMaxLines: 1,
            hintStyle: TextStyle(color : Colors.grey),
           ),
      ),

    );
  }
}

