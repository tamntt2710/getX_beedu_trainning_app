import 'package:beedu_app_training/View/product_shopping_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';

class ProductTabRouter extends StatelessWidget {
  const ProductTabRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Navigator(
      key: Key('4'),
      initialRoute: '/news',
      onGenerateRoute: onGenerateRoute,
    );
  }
  static Route onGenerateRoute(RouteSettings setting){
    return GetPageRoute(
      settings: setting,
      page: () => const ProductCart(),

    );
  }
}