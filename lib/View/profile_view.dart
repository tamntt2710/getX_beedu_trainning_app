import 'package:beedu_app_training/Widget/profile_action.dart';
import 'package:beedu_app_training/const/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
import 'log_in_view.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: CustomAppBars(
          isTrue : false,
          assetData: 'assets/assets/images/logo_web.png',
          pageName: "Quản lý",
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen(),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: ColorConst.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300.h,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListProfileAction('Lịch sử mua hàng',Icons
                      .shopping_cart, ColorConst.green64);
                }),
          )
        ],
      ),
    );
  }
}


