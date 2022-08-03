import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/helper.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  FontWeight fwight;
  TextOverflow overflow;

  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size =  0,
      this.overflow = TextOverflow.ellipsis,
      this.fwight = FontWeight.w400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(

        fontFamily: 'Roboto',
        fontWeight: fwight,
        color: color,
        fontSize: size==0? HelperClass.textSize20:size,
        overflow: overflow,
      ),
    );
  }
}
