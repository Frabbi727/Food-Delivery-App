import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  int _quantity = 0;

  int get quantity => _quantity;

  int _inCartItems = 0;

  int get inCartItems => _inCartItems + _quantity;
  late CartController _cart;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      //print('Got Products');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print('No data');
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity = _quantity + 1);
      // print(_quantity);
    } else {
      _quantity = checkQuantity(_quantity = _quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar('Item Count', 'You Cannot Reduce more',
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
          titleText: Text(
            'Warning ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ));
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        'Item Count',
        'Maximum Order ',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
  }

  void addItem(ProductModel product) {
    String qun = '';
    if (_quantity > 0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _cart.items.forEach((key, value) {
        qun = value.quantity.toString();
        print(
            'The Product Id is>> ${value.id.toString()} and the quantity of the product is== ${value.quantity.toString()}');
      });

      Get.snackbar('Added Item ${qun.toString()} ', 'Successful ',
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15));
    } else {
      Get.snackbar(
        'Add item to cart ${_quantity.toString()}',
        'Minimum Order ',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
  }
}
