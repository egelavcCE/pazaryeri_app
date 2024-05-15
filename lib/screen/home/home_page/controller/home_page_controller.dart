

import 'package:Pazaryeri/data/project_data.dart';
import 'package:Pazaryeri/product/model/product_model.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController{
  RxList<ProductModel> popularProductItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    popularProductItems.value = ProjectData.instance?.popularProductItems ?? [];
  }
}