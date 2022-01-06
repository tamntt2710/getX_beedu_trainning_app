import 'package:get/get.dart';

class SliderHomeController extends GetConnect{
  RxList<dynamic> items = [].obs; // khai báo
  var currentSlide = 0.obs;
}