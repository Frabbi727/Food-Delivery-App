import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded =false;
  bool get isLoaded=>_isLoaded;
  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();

    if (response.statusCode == 200) {
     // print('Got Products');
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      // _recommendedProductList.forEach((element) {
      // // print('{id: ${element.id}, name: ${element.name}, description: ${element.description}, price: ${element.price}, stars:${element.stars}, img: ${element.img}, location: ${element.location}, createdAt: ${element.createdAt}, updatedAt: ${element.updatedAt}, typeId:${element.typeId},  }');
      // var namess = {'${element.name}'};
      // print(namess);
      // });
      _isLoaded=true;
      update();
    } else {
      print('No data');
    }
  }
}
