import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/repository/cart_repo.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id)) {
      print(product.id.toString());
      _items.update(product.id!, (value) {
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          isExist: true,
          quantity: value.quantity! + quantity,
          time: DateTime.now().toString(),
        );
      });
    } else {
      _items.putIfAbsent(
        product.id!,
        () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            isExist: true,
            quantity: quantity,
            time: DateTime.now().toString(),
          );
        },
      );
    }
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        quantity = value.id!;
      });
    }
    return quantity;
  }
}
