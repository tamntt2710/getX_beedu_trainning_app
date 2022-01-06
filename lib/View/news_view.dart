import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';

class NewPages extends StatelessWidget {
  const NewPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: CustomAppBars(
            isTrue:true,
          assetData : 'assets/assets/images/logo_web.png',
          pageName : "Thiện Tri Thức",
            iconData : Icons.search
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border : Border(
                      top: BorderSide(color: Colors.black54, width: 0.2),
                       bottom: BorderSide(color: Colors.black54, width: 0.2)
        )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/assets/images/tracuutiemvaccinecovid19"
                      ".jpg"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Covid_19 nhanh chóng, thuận tiện.",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: Text(
                            "2021-08-12 21:34:45",
                            style: TextStyle(color: Colors.black38, fontSize: 12),
                          ),
                        ),
                        Text("Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                            "Covid_19 nhanh chóng, thuận tiện.")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                 return ListNews();
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
class ListNews extends StatelessWidget {
  const ListNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 150.w,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(
                            "assets/assets/images/product.jpg")),
                  ),
                  // Container(
                  //   // padding: EdgeInsets.symmetric(horizontal: 10.w),
                  //   width: 150.w,
                  //   padding: EdgeInsets.symmetric(
                  //       vertical: 5.h, horizontal: 10.w),
                  //   decoration: BoxDecoration(
                  //     color: Colors.black.withOpacity(0.5),
                  //     borderRadius: BorderRadius.vertical(
                  //         top: Radius.zero, bottom: Radius.circular(10)),
                  //   ),
                  //   child: Text(
                  //     "Thực phẩm bảo vệ sức khỏe dạ dày Tịnh Vị Linh - hộp 20 gói",
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       color: Colors.white,
                  //       overflow: TextOverflow.ellipsis,
                  //     ),
                  //     maxLines: 3,
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Y học cổ truyển chữa mất tiếng".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                      ),
                      maxLines: 3,
                    ),
                    Text(
                      "2021-08-12 21:34:45",
                      style: TextStyle(color: Colors.black38, fontSize:
                      12),

                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text("Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Covid_19 nhanh chóng, thuận tiện. Cách tra cứu kết quả chứng nhận việc tiêm vắc-xin "
                          "Covid_19 nhanh chóng, thuận tiện. ",
                        overflow: TextOverflow.ellipsis,maxLines: 3,),
                    )
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
