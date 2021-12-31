import 'package:beedu_app_training/const/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyImageView extends StatelessWidget{

  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(imgPath,),
        )
    );
  }
}
class CustomIndicator extends StatefulWidget {
  const CustomIndicator({Key? key}) : super(key: key);

  @override
  _CustomIndicatorState createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator> {
  int currentPos = 0;
  List<String> listPaths = [
    "assets/assets/images/banner-dong-y-thien-tri-thuc-home.jpg",
    "assets/assets/images/banner-dong-y-thien-tri-thuc-1.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: listPaths.length,
            options: CarouselOptions(
              viewportFraction: 1.0, // full screen show slide
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;
                  });
                }
            ),
            itemBuilder: (context,index,_){
              return MyImageView(listPaths[index]);
            },
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listPaths.map((url) {
                  int index = listPaths.indexOf(url);
                  return Container(
                    width:  currentPos == index ? 12.0 : 6.0,
                    height: currentPos == index ? 12.0 : 6.0,
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