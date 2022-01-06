import 'package:beedu_app_training/View/shopping_cart_view.dart';
import 'package:beedu_app_training/const/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0), // here the desired height
        child: CustomAppBars(
          isTrue:false,
          prefixIcon: Icons.arrow_back,
          pageName: "Chi tiết sản phẩm", iconDataAfter : Icons.shopping_cart ,
            iconData: Icons.share
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/assets/images/product.jpg"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text(
                    "Thực phẩm bảo vệ dức khỏe dạ dày Tịnh vị Linh - lọ 83g"
                    ,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                    maxLines: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      "154.000đ",
                      style: TextStyle(color: Colors.black38, fontSize:
                      16, decoration: TextDecoration.lineThrough),

                    ),
                  ),
                  Text(
                    "138.000đ",
                    style: TextStyle(color: ColorConst.primaryColor, fontSize:
                    18),

                  ),
                  Divider(height: 0.1, color: Colors.grey.withOpacity(0.1),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("Mô tả",style: TextStyle(color: Colors.black,
                      fontSize: 16
                    ),
                  ),),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      "Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Covid_19 nhanh chóng, thuận tiện. Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Covid_19 nhanh chóng, thuận tiện. Covid_19 nhanh chóng, thuận tiện. Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin"  "Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Covid_19 nhanh chóng, thuận tiện. Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Covid_19 nhanh chóng, thuận tiện. Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Covid_19 nhanh chóng, thuận tiện. Covid_19 nhanh chóng, thuận tiện. Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin"  "Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Covid_19 nhanh chóng, thuận tiện. Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "

                          "Covid_19 nhanh chóng, thuận tiện. Covid_19 nhanh chóng, thuận tiện. Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin",

                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShoppingCart(),
                    ));
              },
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                    color: ColorConst.primaryColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30.h,
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ), Text("Thêm vào giỏ hàng", style: const TextStyle(color:
                    Colors.white, fontSize: 16),)
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
