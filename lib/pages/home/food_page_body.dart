import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/helper.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

import '../../routes/routes_helper.dart';
import '../../widgets/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: .85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = HelperClass.height220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        print(_currentPageValue);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded?Container(
            height: HelperClass.height300,
            // height: 300,
            color: Colors.purple,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(
                      position, popularProducts.popularProductList[position]);
                }),
          ): Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ) ;
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isNotEmpty
                ? popularProducts.popularProductList.length
                : 1,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: Size.square(9.0),
              activeSize: Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(HelperClass.radius5)),
            ),
          );
        }),
        // Popular Text
        SizedBox(
          height: HelperClass.height30,
        ),
        Container(
          // color: Colors.teal,
          margin: EdgeInsets.only(
              left: HelperClass.width20, bottom: HelperClass.height20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(
                width: HelperClass.width10,
              ),
              BigText(text: '.', size: HelperClass.textSize24),
              SizedBox(
                width: HelperClass.width10,
              ),
              SmallText(text: 'Food Paring')
            ],
          ),
        ),
        //List of images and details
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:recommendedProduct.recommendedProductList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.recommendedFood, arguments: {
                      'pageId': index,

                    });

                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: HelperClass.width20,
                        right: HelperClass.width20,
                        bottom: HelperClass.height10),
                    child: Row(
                      children: [
                        Container(
                          height: HelperClass.height120,
                          width: HelperClass.width120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${recommendedProduct.recommendedProductList[index].img!}'
                                  ),
                                  fit: BoxFit.cover),
                              color: Colors.green,
                              borderRadius:
                              BorderRadius.circular(HelperClass.radius20)),
                        ),
                        Expanded(
                          child: Container(
                            height: HelperClass.height100,
                            decoration: BoxDecoration(
                              // color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(HelperClass.radius20),
                                bottomRight: Radius.circular(HelperClass.radius20),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(HelperClass.height10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                  Expanded(child: SmallText(text: recommendedProduct.recommendedProductList[index].description!)),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }): Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    //print('index no $index');
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor), 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          //1st container
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.popularFood, arguments: {
                'pageId': index,

              });
            },
            child: Container(
              //height: HelperClass.heightTwoTwenty,
              height: HelperClass.height220,
              margin: EdgeInsets.only(
                  left: HelperClass.width15, right: HelperClass.height15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(HelperClass.radius30),
                color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${popularProduct.img!}'
                  ),
                ),
              ),
            ),
          ),
          //2nd container for small
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: HelperClass.height140,
              margin: EdgeInsets.only(
                  left: HelperClass.width30,
                  right: HelperClass.width30,
                  bottom: HelperClass.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(HelperClass.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.boxShadowColor1,
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0))
                ],
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(HelperClass.width15,
                    HelperClass.height15, HelperClass.width15, 0),
                decoration: BoxDecoration(
                  // color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(HelperClass.radius20),
                ),
                child: AppColumn(text: popularProduct.name!),
              ),
            ),
          )
        ],
      ),
    );
  }
}
