import 'package:get/get.dart';

import '../../core/model/product.dart';

class CartScreenController extends GetxController {

    Rx<List<Product>> cartProducts = Rx<List<Product>>([]);
}