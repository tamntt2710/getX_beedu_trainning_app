import 'package:beedu_app_training/View/news_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
class NewsTabRouter extends StatelessWidget {
  const NewsTabRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Navigator(
      key: Key('3'),
      initialRoute: '/news',
      onGenerateRoute: onGenerateRoute,
    );
  }
  static Route onGenerateRoute(RouteSettings setting){
    return GetPageRoute(
      settings: setting,
      page: () => const NewPages(),

    );
  }
}
