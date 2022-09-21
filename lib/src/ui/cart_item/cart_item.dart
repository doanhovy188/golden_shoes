import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_shoes/src/core/model/product.dart';
import 'package:golden_shoes/src/ui/cart_screen/cart_viewmodel.dart';
import 'package:golden_shoes/src/ui/common/commonWidget.dart';
import 'package:golden_shoes/src/utils/color.dart';

class CartItem extends StatelessWidget {
  CartItem({super.key, required this.product});

  final Product product;

  final CartScreenController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: Get.width * 3 / 11,
              width: Get.width * 3 / 11,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(product.colorHex()),
              ),
              child: Stack(
                children: [
                  Container(
                    transform: Matrix4.translationValues(40, 0, 0),
                    child: Transform.scale(
                      scale: 1.7,
                      child: rotateNetWorkImage(
                        product.imageUrl,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 14,
                        color: blackColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '\$ ${product.price}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: blackColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              c.decProduct(product);
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffeeeeee),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                'assets/minus.png',
                                height: 7,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Obx(() =>
                              Text(c.cartProducts.value[product].toString())),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              c.incProduct(product);
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffeeeeee),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                'assets/plus.png',
                                height: 7,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          c.deleteCartItem(product);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: yellowColor,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            'assets/trash.png',
                            height: 17,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
