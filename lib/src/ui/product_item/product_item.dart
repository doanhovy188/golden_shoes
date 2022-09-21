import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_shoes/src/ui/cart_screen/cart_viewmodel.dart';
import 'dart:math';

import 'package:golden_shoes/src/utils/color.dart';

import '../../core/model/product.dart';
import '../common/commonWidget.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.product});

  final Product product;
  final CartScreenController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(
              color: Color(product.colorHex()),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Stack(children: [
            ClipRRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Opacity(
                  opacity: 0.2,
                  child: Transform(
                    transform: Matrix4.translationValues(-20, 35, 0),
                    child: Transform.rotate(
                      angle: -pi / 7.5,
                      child: Image.network(
                        product.imageUrl,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            rotateNetWorkImage(product.imageUrl),
          ]),
        ),
        const SizedBox(
          height: 30,
        ),
        productName(product.name),
        const SizedBox(
          height: 25,
        ),
        productDescription(product.description),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ ${product.price}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18, color: blackColor),
            ),
            GestureDetector(
              onTap: () {
                c.cartProducts.value[product] = 1;
                c.cartProducts.refresh();
                c.caculateTotalCash();
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: yellowColor,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Obx(() => c.cartProducts.value.containsKey(product)
                        ? Image.asset(
                            'assets/check.png',
                            height: 17,
                          )
                        : const Text(
                            'ADD TO CART',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                                color: blackColor),
                          ))),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 70,
        )
      ]),
    );
  }

  RichText productDescription(String text) => RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
            text: text,
            style:
                const TextStyle(color: greyColor, height: 1.7, fontSize: 14)),
      );

  Widget productName(String text) => Text(
        text,
        style: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: blackColor),
      );
}
