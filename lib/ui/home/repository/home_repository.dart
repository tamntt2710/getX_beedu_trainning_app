import 'package:beedu_app_training/ui/home/provider/home_provider.dart';
import 'package:get/get.dart';

class HomeRepository{
  HomeProvider provider;
  HomeRepository(this.provider);
  Future<Response<dynamic>> getSlideDataHome() async{
    return await provider.getSliderData();
  }
  Future<Response<dynamic>> getNewsHome() async{
    return await provider.getListNews();
  }
  Future<Response<dynamic>> getProductsHome() async{
    return await provider.getListProduct();
  }
  }

