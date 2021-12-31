import 'package:beedu_app_training/const/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: CustomAppBars(
            isTrue : true,
            assetData: 'assets/assets/images/logo_web.png',
            pageName: "Thiện Tri Thức",
            iconData: Icons.shopping_cart,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
          child: SizedBox(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListProducts();
    },)
    ,
    )
    ,
    ),
        )
    ,
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: SizedBox(
            // height: 300.h,
            width: 200.w,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(
                          "assets/assets/images/product.jpg")),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            height: 300.h,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      "Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Covid_19 nhanh chóng, thuận tiện. Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Covid_19 nhanh chóng, thuận tiện. Covid_19 nhanh chóng, thuận tiện. Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin",
                      overflow: TextOverflow.ellipsis, maxLines: 4,),
                  ),
                  Container(
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
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ), Text("Thêm vào giỏ hàng", style: TextStyle(color:
                        Colors.white, fontSize: 16),)
                      ],

                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


