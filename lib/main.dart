
import 'package:beedu_app_training/ui/main/binding/main_page_binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'const/constant.dart';
import 'ui/main/main_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainPageBinding(),
      home: ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MaterialApp(
          title: 'Thiện tri thức',
          theme: ThemeData(
            primaryColor: ColorConst.primaryColor,
          ),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}


class CustomAppBars extends PreferredSize{
  CustomAppBars({String? assetData,IconData? prefixIcon, IconData? iconData,String?
  pageName, double height = 50, Widget? child,IconData? iconDataAfter,
  required isTrue })
      :super
      (child:
  AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Container(
        child: Text(
          pageName!,
          style: ColorConst.textStyleAppBar,
        )),
     leading: isTrue ? Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Image.asset(assetData!,
          fit: BoxFit.fill),
    ) : Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Icon(prefixIcon,color: ColorConst.primaryColor,size: 30,),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(iconDataAfter,color: ColorConst.primaryColor,size: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(iconData,color: ColorConst.primaryColor,size: 30,),
            ),
          ],
        ),
      ),
    ],
  ), preferredSize: Size.fromHeight(height));
}


