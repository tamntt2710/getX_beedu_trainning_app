import 'package:beedu_app_training/Widget/custom_button.dart';
import 'package:beedu_app_training/const/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
class CustomInfor extends StatefulWidget {
  const CustomInfor({Key? key}) : super(key: key);

  @override
  _CustomInforState createState() => _CustomInforState();
}

class _CustomInforState extends State<CustomInfor> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: CustomAppBars(
          isTrue:false,
          prefixIcon: Icons.arrow_back,
          pageName : "Thông tin người nhận hàng",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(child: Column(
            children: [
              FillInforCustom('Họ tên'),
              FillInforCustom('Email'),
              FillInforCustom('Số điện thoại'),
              FillInforCustom('Số nhà'),
              FillInforCustom('Địa chỉ'),
              FillInforCustom('Xã/phường/thị trấn'),
              FillInforCustom('Quận/Huyện'),
              FillInforCustom('Chọn tỉnh/Thành phố'),
              CustomButton(text: "Xác nhận",)
            ],
          ),

          ),
        ),
      ),
    );
  }
}


class FillInforCustom extends StatefulWidget {
  String? title;
  FillInforCustom(this.title);

  @override
  _FillInforCustomState createState() => _FillInforCustomState();
}

class _FillInforCustomState extends State<FillInforCustom> {
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextFormField(
        focusNode: myFocusNode,
        decoration: InputDecoration(
            labelText: widget.title,
            labelStyle: TextStyle(color: myFocusNode.hasFocus ?
            ColorConst.green73:
            Colors.black38)
        ),
      ),
    );
  }
}

