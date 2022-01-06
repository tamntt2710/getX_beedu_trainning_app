import 'package:get/get.dart';

class HomeProvider extends GetConnect {
  final String BASE_URL = "https://dongythientrithuc.vn/api";
  final String API_GET_SLIDE_HOME = "/getslidehome";
  final String API_GET_LIST_NEWS_HOME = "/getnewshome";
  final String API_GET_PRODUCTS = "/getproducts";

  getSliderData() => get(BASE_URL + API_GET_SLIDE_HOME );
  getListNews() => get(BASE_URL + API_GET_LIST_NEWS_HOME);
  getListProduct() => get(BASE_URL + API_GET_PRODUCTS);

}