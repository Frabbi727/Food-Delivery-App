import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/helper.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  FontWeight fwight;
  TextOverflow overflow;
 //TextAlign textAlignment;
  double height;

  SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.size = 0,
      this.overflow = TextOverflow.ellipsis,
      //this.textAlignment = TextAlign.center,
      this.height = 1.2,
      this.fwight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    //  textAlign: textAlignment,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: fwight,
        color: color,
        fontSize: size==0? HelperClass.textSize12:size,
        //overflow: overflow,
        height: height,
      ),
    );
  }
}
