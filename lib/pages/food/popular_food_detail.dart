import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/helper.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

import '../../utils/app_constants.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  //int pageId;
  PopularFoodDetail({
    Key? key,
    // required this.pageId
  }) : super(key: key);
  int? pageId = Get.arguments != null ? Get.arguments["pageId"] : null;

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId ?? 0];
    Get.find<PopularProductController>()
        .initProduct(product,Get.find<CartController>());
    print('Page id ${pageId}');
    print('Product List Value:: ${product.name}');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: HelperClass.height350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${product.img ?? ''}'),
                  ),
                ),
              )),
          // Showing two image
          Positioned(
              left: HelperClass.width20,
              right: HelperClass.width20,
              top: HelperClass.height45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                    ),
                    onTap: () {
                      Get.to(() => MainFoodPage());
                    },
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          // Intro Duction
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: HelperClass.height350 - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: HelperClass.width20,
                right: HelperClass.width20,
                top: HelperClass.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name ?? ''),
                  SizedBox(
                    height: HelperClass.height20,
                  ),
                  BigText(text: 'Introduce'),
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableTextWidget(
                    text: product.description ?? '',
                    // "Lorem Ipsum is simply dummytextLorem Lorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremLorem Ipsum is simply dummytextLoremIpsum is simply dummytextLorem Ipsum is simply dummytextLorem Ipsum is simply dummytext"
                  )))
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.remove),
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                    ),
                    SizedBox(
                      width: HelperClass.width5,
                    ),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(
                      width: HelperClass.width5,
                    ),
                    GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add)),
                  ],
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
                child: InkWell(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: BigText(
                      text: '\$ ${product.price ?? ''} | Added to Cart ',
                      color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
