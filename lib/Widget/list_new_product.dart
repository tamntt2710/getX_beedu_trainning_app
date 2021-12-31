import 'package:beedu_app_training/View/product_detail_view.dart';
import 'package:beedu_app_training/const/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ListNewProducts extends StatelessWidget {
  String text;
  bool isProduct = true;
  ListNewProducts(this.text, this.isProduct);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10.h),
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal : 8.0),
              child: Text(
                text,
                style: TextStyle(
                    color: ColorConst.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 150.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  if(isProduct)
                  return NewProducts(true);
                  else
                    return NewProducts(false);
                },
              ),
            )
          ],
        ));
  }
}

class NewProducts extends StatelessWidget {
  bool isProduct = true;
  NewProducts(this.isProduct);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailView(),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: SizedBox(
            width: 200.w,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset("assets/assets/images/product.jpg")),
                ),
                Container(
                   // padding: EdgeInsets.symmetric(horizontal: 10.w),

                  child: isProduct ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10
                        .h),
                    child: Text(
                      "Thực phẩm bảo vệ sức khỏe dạ dày Tịnh Vị Linh - hộp 20 gói",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ) : Container(
                    width: 192.w,
                    padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.vertical(top:Radius.zero,bottom:
                    Radius.circular(10)
                  ),
                    ),
                    child: Text(
                      "Thực phẩm bảo vệ sức khỏe dạ dày Tịnh Vị Linh - hộp 20 gói",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                    ),
                  ) ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}