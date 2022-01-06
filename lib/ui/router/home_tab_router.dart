import 'package:beedu_app_training/ui/home/bindings/home_binding.dart';
import 'package:beedu_app_training/ui/home/controllers/home_controller.dart';
import 'package:beedu_app_training/ui/home/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
class HomeTabRouter extends StatelessWidget {
  const HomeTabRouter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Navigator(
      key: Key('1'),
      initialRoute: ('/home'),
      onGenerateRoute: onGenerateRoute,
    );
  }

  static Route onGenerateRoute(RouteSettings settings){
    return GetPageRoute(
      settings : settings,
      page :()=>const HomePage(),
      binding: HomeBinding(),
    );
  }
}
