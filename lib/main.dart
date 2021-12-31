import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'View/home_view.dart';
import 'View/news_view.dart';
import 'View/product_shopping_cart.dart';
import 'View/profile_view.dart';
import 'Widget/four_criteria.dart';
import 'Widget/list_new_product.dart';
import 'Widget/slide_banner_home.dart';
import 'const/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'Thiện tri thức',
        theme: ThemeData(
          primaryColor: ColorConst.primaryColor,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey bottomNavigationKey = GlobalKey();
  int currentPage = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller : controller,
          children : [
            HomePage(),
            NewPages(),
            ProductCart(),
            Profile()
          ]

        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.eleven_mp_outlined, title: "Tin tức"),
            TabData(iconData: Icons.shopping_cart, title: "Sản phẩm"),
            TabData(iconData: Icons.account_circle, title: "Cá nhân")
          ],
          initialSelection: 1,
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            controller.jumpToPage(position);
            setState(() {
              currentPage = position;
            });
          },
        )
    );
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


