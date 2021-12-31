import 'package:beedu_app_training/Widget/four_criteria.dart';
import 'package:beedu_app_training/Widget/list_new_product.dart';
import 'package:beedu_app_training/Widget/slide_banner_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: CustomAppBars(
          isTrue:true,
          assetData : 'assets/assets/images/logo_web.png',
          pageName : "Thiện Tri Thức",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              CustomIndicator(),
              FourCriteria(),
              SizedBox(height: 20.h,),
              ListNewProducts("Sản phẩm mới",true),
              SizedBox(height: 20.h,),
              ListNewProducts("Bài viết mới",false),
            ],
        ),
      ),
    );
  }
}