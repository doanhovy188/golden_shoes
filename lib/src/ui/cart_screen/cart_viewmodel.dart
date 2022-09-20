import 'package:get/get.dart';

import '../../core/model/product.dart';

class CartScreenController extends GetxController {
  Rx<Map<Product, int>> cartProducts = Rx<Map<Product, int>>({});

  Rx<double> totalCash = Rx<double>(0);

  void deleteCartItem(Product product) {
    if (!cartProducts.value.containsKey(product)) return;
    cartProducts.value.remove(product);
    cartProducts.refresh();
    caculateTotalCash();
  }

  void incProduct(Product product) {
    if (!cartProducts.value.containsKey(product)) return;
    cartProducts.value.update(product, (value) => value + 1);
    cartProducts.refresh();
    caculateTotalCash();
  }

  void decProduct(Product product) {
    if (!cartProducts.value.containsKey(product)) return;
    cartProducts.value.update(product, (value) => value - 1);
    if (cartProducts.value[product] == 0) deleteCartItem(product);
    cartProducts.refresh();
    caculateTotalCash();
  }

  void caculateTotalCash() {
    double temp = 0;
    for (var element in cartProducts.value.entries) {
      temp += element.key.price * element.value;
    }
    totalCash.value = temp.toPrecision(2);
  }
}
