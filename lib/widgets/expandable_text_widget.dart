

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/helper.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

   ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText= true;
  double textHeight= 120.h;
 // double textHeight= HelperClass.screenHeight/5.6;

@override
 void initState(){
  super.initState();
  if(widget.text.length>textHeight){
    firstHalf = widget.text.substring(0, textHeight.toInt());
    secondHalf= widget.text.substring(textHeight.toInt()+1, widget.text.length);
  }else{
    firstHalf= widget.text;
    secondHalf='';
  }
}

  @override
  Widget build(BuildContext context) {

    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf ):Column(
        children: [
        SmallText(text: hiddenText? ('$firstHalf...'):(firstHalf+secondHalf), size: 18.sp,),
          InkWell(
            onTap: (){
              setState((){
                hiddenText=!hiddenText;
              });
            },
            child: Row(children: [
              SmallText(text: hiddenText? 'Show More ':'Show Less ', color: AppColors.mainColor,size: 20.sp,),
              Icon(hiddenText? Icons.arrow_drop_down: Icons.arrow_drop_up, color: AppColors.mainColor,),
            ],),
          )
        ],
      ),

    );
    // return SmallText(text: firstHalf+secondHalf);
  }
}
