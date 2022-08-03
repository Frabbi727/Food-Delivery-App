import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/helper.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BigText(text: text, size: HelperClass.textSize20),
        SizedBox(
          height: HelperClass.height10,
        ),
        Row(
          children: [
            Wrap(
                children: List.generate(
                    5,
                        (index) => Icon(
                      Icons.star,
                      color: AppColors.mainColor,
                      size: HelperClass.height15,
                    ))),
            SizedBox(
              width: HelperClass.width10,
            ),
            SmallText(
              text: '4.5',
            ),
            SizedBox(
              width: HelperClass.width10,
            ),
            SmallText(
              text: '2725',
            ),
            SizedBox(
              width: HelperClass.width10,
            ),
            SmallText(
              text: 'Comment',
            ),
          ],
        ),
        SizedBox(
          height: HelperClass.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: '1.7 lm',
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '32min',
                iconColor: AppColors.iconColor2),
          ],
        ),
      ],
    );
  }
}
