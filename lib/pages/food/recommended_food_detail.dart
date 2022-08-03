import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/utils/helper.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

import '../../routes/routes_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
 //int pageId;
   RecommendedFoodDetail({Key? key,
     //required this.pageId
   }) : super(key: key);
   int?pageId = Get.arguments !=null ?  Get.arguments["pageId"] : null;
  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId?? 0];
    print(pageId);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: AppIcon(
                    icon: Icons.clear,
                  ),
                  onTap: (){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(HelperClass.height20),
                child: Container(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(HelperClass.radius20),
                        topRight: Radius.circular(HelperClass.radius20),
                      ),
                      color: Colors.white),
                  child: BigText(
                    text:
                    '${product.name??''}',
                    size: HelperClass.textSize24,
                    fwight: FontWeight.w400,
                  ),
                )),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: HelperClass.height300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${product.img ?? ''}',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: HelperClass.width20, right: HelperClass.width20),
                  child: ExpandableTextWidget(
                      text: '${product.description??''}'

                        //  'Lorem Ipsum is simply dummytextLorem Lorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremIpsum is simply dummytextLorem Ipsum is simply dummytextLorem Ipsum is simply dummytextLorem Ipsum is simply dummytextLorem Lorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremIpsum is simply dummytextLorem Ipsum is simply dummytextLorem Ipsum is simply dummytext'
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconBackGroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: HelperClass.height20,
                ),
                BigText(
                  text: '\$ ${product.price??''} X 0 ',
                  color: AppColors.mainBlackColor,
                  size: HelperClass.textSize20,
                ),
                AppIcon(
                  icon: Icons.add,
                  iconBackGroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: HelperClass.height20,
                ),
              ],
            ),
          ),
          Container(
            height: HelperClass.height120,
            padding: EdgeInsets.only(
              left: HelperClass.width20,
              right: HelperClass.width20,
              top: HelperClass.height20,
              bottom: HelperClass.height20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              //color: Colors.teal,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(HelperClass.radius20 * 2),
                topLeft: Radius.circular(HelperClass.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //1st button for increase value
                Container(
                  padding: EdgeInsets.only(
                    top: HelperClass.height20,
                    bottom: HelperClass.height20,
                    left: HelperClass.width20,
                    right: HelperClass.width20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(HelperClass.radius20),
                  ),
                  child: AppIcon(
                    icon: Icons.favorite,
                    iconBackGroundColor: Colors.white,
                    iconColor: AppColors.mainColor,
                    iconSize: HelperClass.height35,
                  ),
                ),
                // 2nd for showing value
                Container(
                  padding: EdgeInsets.only(
                    top: HelperClass.height20,
                    bottom: HelperClass.height20,
                    left: HelperClass.width20,
                    right: HelperClass.width20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(HelperClass.radius20),
                  ),
                  child: BigText(
                      text: '\$ 10 | Added to Cart ', color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
