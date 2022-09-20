import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_shoes/src/ui/cart_screen/cart_viewmodel.dart';

import '../../utils/color.dart';
import '../cart_item/cart_item.dart';
import '../common/screen_title.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final CartScreenController c = Get.find();

  @override
  Widget build(BuildContext context) {
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
              Image.asset(
                'assets/nike.png',
                height: Get.height / 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ScreenTitle(title: 'Your cart'),
                  Obx(() => ScreenTitle(title: '\$${c.totalCash.value}')),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Obx(() => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: c.cartProducts.value.entries
                              .map((entry) => CartItem(product: entry.key))
                              .toList(),
                        ))),
              ),
            ],
          )),
        ),
      ]),
    ));
  }
}
