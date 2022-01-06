import 'package:beedu_app_training/ui/home/controllers/home_controller.dart';
import 'package:beedu_app_training/ui/home/controllers/slider_home_controller.dart';
import 'package:beedu_app_training/ui/home/provider/home_provider.dart';
import 'package:beedu_app_training/ui/home/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Get.put(HomeProvider()));
    Get.lazyPut(() => SliderHomeController());
    Get.lazyPut(() => HomeRepository(HomeProvider()));
    Get.put(HomePageController(Get.find(),Get.find()));

  }

}