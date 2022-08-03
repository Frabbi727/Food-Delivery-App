import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/helper.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  double size;


  final Color iconColor;


   IconAndTextWidget({Key? key, required this.icon, required this.text,  required this.iconColor, this.size=0 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: size==0? HelperClass.height24: size,),
        SizedBox(width: HelperClass.width5,),
        SmallText(text: text, ),
      ],
    );
  }
}
