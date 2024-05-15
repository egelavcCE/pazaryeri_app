

import 'package:get/get.dart';

import '../../../../data/project_data.dart';
import '../../../../product/model/product_model.dart';

class ShoppingCardController extends GetxController {
  RxList<ProductModel>? shoppingCardProductItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    shoppingCardProductItems?.value = ProjectData.instance?.shoppingCardProductItems ?? [];
  }

  void addProductToShoppingCard(ProductModel? product) {
    if(product != null){
      shoppingCardProductItems!.add(product);
    }
  }
}
//not:burda direkt ProjectDataya da eklenebilir veya shoppingCardProductItems ama büyük projelerde direkt olarak veritabanına!