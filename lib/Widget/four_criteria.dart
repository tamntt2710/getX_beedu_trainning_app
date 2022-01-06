import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FourCriteria extends StatelessWidget {
  const FourCriteria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/assets/images/amduong.png",
      "assets/assets/images/amduong.png",
      "assets/assets/images/amduong.png",
      "assets/assets/images/amduong.png"
    ];
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        // padding: EdgeInsets.symmetric(vertical : 10.h,horizontal: 90),
        child: GridView.builder(
          itemCount: images.length,
          shrinkWrap: true,
          // new line
          padding: EdgeInsets.all(5.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 16 / 9,
              // tỉ lệ chiều rộng chiều cao
              crossAxisCount: 2,
              mainAxisSpacing: 1.0),
          itemBuilder: (BuildContext context, int index) {
            return CenterItem(images[index], "Description", index);
          },
        ));
  }
}

class CenterItem extends StatefulWidget {
  String urlImg;
  String descript;
  int leftLocation;

  CenterItem(this.urlImg, this.descript, this.leftLocation);

  @override
  _CenterItemState createState() => _CenterItemState();
}

class _CenterItemState extends State<CenterItem> {
  double targetValue = pi;
  bool isBack = true;
  double angle = 0;

  void rotate() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: rotate,
      child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: angle),
          duration: const Duration(seconds: 2),
          builder: (BuildContext context, double size, Widget? child) {
            if (angle >= pi / 2) {
              isBack = false;
            } else {
              isBack = true;
            }
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..setEntry(3, 2, 0.001),
              // ..rotateY(pi), // allow to rotate
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  border: widget.leftLocation == 0
                      ? Border(
                          right: BorderSide(color: Colors.black54, width: 0.2),
                          bottom: BorderSide(color: Colors.black54, width: 0.2))
                      : widget.leftLocation == 3
                          ? Border(
                              left:
                                  BorderSide(color: Colors.black54, width: 0.2),
                            )
                          : widget.leftLocation == 2
                              ? Border(
                    right: BorderSide(color: Colors.black54, width: 0.2),
                  )
                              : widget.leftLocation == 1
                              ? Border(
                      left:
                      BorderSide(color: Colors.black54, width: 0.2),
                                      bottom: BorderSide(
                                          color: Colors.black54, width: 0.2))
                                  : Border(),
                ),
                child: isBack
                    ? Column(
                        children: [
                          Container(
                            height: 50.h,
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Image.asset(widget.urlImg,fit: BoxFit.fill,)),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Center(
                            child: Text(
                              widget.descript,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: Text(
                            "Đơn vị giữ gìn, bảo tồn và phát huy giá trị các cây thuốc, "
                            "bài thuốc gia truyền chăm sóc sức khỏe hàng đầu"),
                      ),
              ),
            );
          }),
    );
  }
}
