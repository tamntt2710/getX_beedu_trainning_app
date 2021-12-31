import 'package:beedu_app_training/const/constant.dart';
import 'package:flutter/material.dart';
class ListProfileAction extends StatelessWidget {
  String? textTitle;
  IconData? iconData;
  Color? color;
  ListProfileAction(this.textTitle,this.iconData,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.3)),
          )),
      child: ListTile(
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          child: Container(
            width: 40,
            height: 48,
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            alignment: Alignment.center,
            child: Icon(
              iconData,
              color: color,
              size: 30,
            ),
          ),
        ),
        title: Text(textTitle!,style: TextStyle(color: color),),
        trailing: Icon(
          Icons.arrow_forward_ios_sharp,color: color,
          size: 15,
        ),
      ),
    );
  }
}