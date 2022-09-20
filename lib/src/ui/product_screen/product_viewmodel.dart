import 'package:get/get.dart';

import '../../core/model/product.dart';

class ProductScreenController extends GetxController {
  Rx<List<Product>> products = Rx<List<Product>>([]);
}
