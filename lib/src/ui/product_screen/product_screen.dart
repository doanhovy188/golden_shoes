import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:golden_shoes/src/core/model/product.dart';
import 'package:golden_shoes/src/ui/cart_screen/cart_screen.dart';
import 'package:golden_shoes/src/ui/cart_screen/cart_viewmodel.dart';
import 'package:golden_shoes/src/ui/common/screen_title.dart';
import 'package:golden_shoes/src/ui/product_item/product_item.dart';
import 'package:golden_shoes/src/ui/product_screen/product_viewmodel.dart';
import 'package:golden_shoes/src/utils/color.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  ProductScreenController pController = Get.put(ProductScreenController());
  CartScreenController cController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    getProduct();
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Positioned(
          top: -130,
          left: -180,
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: const BoxDecoration(
              color: yellowColor,
              shape: BoxShape.circle,
            ),
            // transform: Matrix4.translationValues(-180, -130, 1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/nike.png',
                    height: Get.height / 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => CartScreen());
                    },
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: Get.height / 20,
                      color: blackColor,
                    ),
                  ),
                ],
              ),
              const ScreenTitle(title: 'Our Products'),
              Expanded(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Obx(() => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: pController.products.value
                              .map((product) => ProductItem(product: product))
                              .toList(),
                        ))),
              ),
            ],
          )),
        ),
      ]),
    ));
  }

  Future<void> getProduct() async {
    final String response = await rootBundle.loadString('data/shoes.json');
    final data = await json.decode(response);
    List rawProduct = data['shoes'];
    for (var element in rawProduct) {
      pController.products.value.add(Product.fromJson(element));
    }
  }
}
