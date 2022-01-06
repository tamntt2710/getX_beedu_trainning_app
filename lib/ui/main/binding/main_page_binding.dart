import 'package:beedu_app_training/ui/main/controller/main_page_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class MainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainPageController());
  }
}