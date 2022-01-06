import 'package:beedu_app_training/ui/home/ui/home_view.dart';
import 'package:beedu_app_training/ui/main/controller/main_page_controller.dart';
import 'package:beedu_app_training/ui/router/account_tab_router.dart';
import 'package:beedu_app_training/ui/router/home_tab_router.dart';
import 'package:beedu_app_training/ui/router/news_tab_router.dart';
import 'package:beedu_app_training/ui/router/products_tab_router.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/keep_alive_wrapper.dart';

class MainPage extends GetView<MainPageController> {
  List<Widget> tabs = [
    // HomePage(),
    // HomePage(),
    // HomePage(),
    // HomePage(),
    HomeTabRouter(),
     NewsTabRouter(),
     ProductTabRouter(),
      AccountTabRouter(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Scaffold(
       body :
       tabs.elementAt(controller.currentPage.value) ,
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.eleven_mp_outlined, title: "Tin tức"),
            TabData(iconData: Icons.shopping_cart, title: "Sản phẩm"),
            TabData(iconData: Icons.account_circle, title: "Cá nhân")
          ],
          initialSelection: 0,
          onTabChangedListener: (position) {
              controller.currentPage.value = position;
          },
        )
    )
    );
  }

}