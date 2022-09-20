import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golden_shoes/src/ui/common/commonWidget.dart';
import 'package:golden_shoes/src/utils/color.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: Get.width * 3 / 11,
          width: Get.width * 3 / 11,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff22AFDC),
          ),
          child: Stack(
            children: [
              Container(
                transform: Matrix4.translationValues(40, 0, 0),
                child: Transform.scale(
                  scale: 1.7,
                  child: rotateNetWorkImage(
                    "https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/react-miler-mens-running-shoe-DgF6nr-removebg-preview.png",
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Container(
          color: Colors.blueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nike React Miler',
                style: TextStyle(
                    fontSize: 14,
                    color: blackColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '\$89.97',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: Colors.yellowAccent,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
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
                        const Text('1'),
                        Container(
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
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: yellowColor,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        'assets/trash.png',
                        height: 17,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
