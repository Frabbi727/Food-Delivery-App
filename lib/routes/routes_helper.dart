import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/pages/food/recommended_food_detail.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-Food';

  static String getInitial() => '$initial';

  //static String getPopularFood(int pageId) => '$popularFood? pageId= $pageId';

  //static String getRecommendedFood(int pageId) => '$recommendedFood? pageId= $pageId';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return MainFoodPage();
        }),
    GetPage(
      name: popularFood,
      page: (){
       // var pageId= Get.parameters['pageId'] ;
       // print("777777777777777777$pageId");
        return PopularFoodDetail();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(

      name: recommendedFood,
      page: () {
        //var pageId= Get.parameters['pageId'] ;
        return RecommendedFoodDetail();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
