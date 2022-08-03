import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/helper.dart';
import 'package:food_delivery_app/widgets/big_text.dart';


import '../../widgets/small_text.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {

  @override
  Widget build(BuildContext context) {
   // print("Device Size Height = "+ MediaQuery.of(context).size.height.toString());
    //print("Device Size Width = "+ MediaQuery.of(context).size.width.toString());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              child: Center(
                child: Container(
                  color: Colors.orange,
                  padding: EdgeInsets.only(left: HelperClass.width20, right: HelperClass.width20),
                  margin: EdgeInsets.only(top: HelperClass.height15, bottom: HelperClass.height15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(text: 'Bangladesh', color: AppColors.mainColor ,),
                          Row(
                            children: [
                              SmallText(
                                 text: 'Dhaka' ,color: AppColors.mainBlackColor,

                              ),
                              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down_rounded,)),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: HelperClass.height45,
                        width: HelperClass.width45,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(HelperClass.radius15),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: HelperClass.height24,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: SingleChildScrollView(child: FoodPageBody())),
          ],
        ),
      ),
    );
  }
}
