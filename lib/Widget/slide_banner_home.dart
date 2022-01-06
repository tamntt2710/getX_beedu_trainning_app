import 'package:beedu_app_training/const/constant.dart';
import 'package:beedu_app_training/ui/home/controllers/slider_home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class MyImageView extends StatelessWidget{

  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network("http://dongythientrithuc"
              ".vn/public/upload/images/slides/${imgPath}",),
        )
    );
  }
}

class CustomIndicatorState extends GetView<SliderHomeController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Obx(() {

            return CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1.0, // full screen show slide
                autoPlay: true,
                onPageChanged: (index, reason) {
                  // controller.slideController = index;
                      }),
              items : controller.items.map((element) =>
                MyImageView(element)).toList());

            },
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.items.map((url) {
                  int index = controller.items.indexOf(url);
                  return Container(
                    width:  controller.currentSlide == index ? 12.0 : 6.0,
                    height: controller.currentSlide == index ? 12.0 : 6.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConst.primaryColor,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}