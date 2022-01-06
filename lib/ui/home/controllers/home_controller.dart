import 'package:get/get.dart';
import 'package:beedu_app_training/ui/home/controllers/slider_home_controller.dart';
import 'package:beedu_app_training/ui/home/repository/home_repository.dart';

import 'news_home_controller.dart';

class HomePageController extends GetxController{
    @override
    void onInit() {
      super.onInit();
      print("Some thing");
      getSilderHome();
    }

    HomeRepository repository;
    SliderHomeController slideController ;
    // NewsHomeController newsController;
    // ProductHomeController productController;
    HomePageController(this.repository,this.slideController,
     //   this.newsController,this.productController
        );

    getSilderHome(){
        repository.getSlideDataHome().then((value){
          for(var i in value.body['data']as List){
              slideController.items.add(i["image"]);
          }
          print(slideController.items.length);
        });
    }


}