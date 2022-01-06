
import 'package:beedu_app_training/View/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
class AccountTabRouter extends StatelessWidget {
  const AccountTabRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Navigator(
      key: Key('5'),
      initialRoute: '/account',
      onGenerateRoute: onGenerateRouter,
    );
  }
  static Route onGenerateRouter(RouteSettings settings){
    return GetPageRoute(
      settings : settings,
      page: () => const Profile(),
    );
  }
}
