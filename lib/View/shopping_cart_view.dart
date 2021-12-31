import 'package:beedu_app_training/Widget/profile_action.dart';
import 'package:beedu_app_training/const/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
import 'custom_infor_view.dart';


class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: CustomAppBars(
          isTrue: false,
          prefixIcon: Icons.arrow_back_outlined,
          pageName: "Giỏ hàng",
          iconData: Icons.shopping_cart,
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomInfor(),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(color: ColorConst.green64),
              child: ListProfileAction(
                  'Địa chỉ giao hàng', Icons.add_location_rounded, Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Text(
                    "Ghi chú : ",
                    style: TextStyle(color: ColorConst.green64, fontSize: 14),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhập ghi chú đơn hàng',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 10.h),
            child: Container(
              height: 160.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Flexible(
                    flex : 1 ,
                    child: FittedBox(
                      child: Image.asset("assets/assets/images/product.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 8.0,
                          horizontal: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Thực phẩm bảo vệ sức khỏe dạ dày Tịnh Vị Linh -"
                              " hộp 20 gói",style: TextStyle(fontWeight:
                          FontWeight.bold,fontSize: 16),),
                          SizedBox(height: 5.h,),
                          Text("138.600đ",style:TextStyle(color :
                          ColorConst.green64,fontSize: 14),),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              QuantityProducts(),
                              Icon(Icons.delete,color: Colors.black38)
                            ],
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0,
                      horizontal: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Tổng: 138.600đ",style:TextStyle(color :
                      ColorConst.green64,fontSize: 14),),
                      Text("Chưa bao gồm phí vận chuyển",style: TextStyle
                        (fontSize: 12),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConst.primaryColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Mua ngay",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),

                        ),
                      ),
                    ),

                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class QuantityProducts extends StatelessWidget {
  const QuantityProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 30.h,
          width: 30.w,
          decoration : BoxDecoration(
              border: Border.all(color: Colors.black38,)
          ),
          child: Center(
            child: Text("-",style: TextStyle(color:
            Colors
                .black54,fontSize: 20),),
          ),
        ),
        Container(
          height: 30.h,
          width: 50.w,
          decoration : BoxDecoration(
              border: Border.all(color: Colors.black38,)
          ),
          child: Center(
            child: Text("2",style: TextStyle(color: Colors
                .black87,fontSize: 14),),
          ),
        ),
        Container(
          height: 30.h,
          width: 30.w,
          decoration : BoxDecoration(
              border: Border.all(color: Colors.black38,)
          ),
          child: Center(
            child: Text("+",style: TextStyle(color: Colors
                .black54,fontSize: 20),),
          ),
        )

      ],
    );
  }
}

