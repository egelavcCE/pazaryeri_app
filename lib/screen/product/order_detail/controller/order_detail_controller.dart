

import 'package:get/get.dart';

import '../../../../product/model/product_model.dart';

class OrderDetailController extends GetxController{
  Rx<ProductModel>? orderDetailItem = ProductModel().obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if(arguments != null && arguments is ProductModel){
      orderDetailItem!.value = arguments;
    }
  }
}