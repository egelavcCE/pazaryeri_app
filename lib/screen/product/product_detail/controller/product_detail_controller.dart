

import 'package:get/get.dart';

import '../../../../product/init/init.dart';
import '../../../../product/model/product_model.dart';
import '../../../../product/model/route_arguments_model.dart';
import '../model/comment_model.dart';

class ProductDetailController extends GetxController{
  Rx<ProductModel>? model = ProductModel().obs;
  RxList<CommentModel> commentItems = <CommentModel>[].obs;
  Rx<int> index = 0.obs;
  RxBool isProductDetail = false.obs;

  @override
  void onInit() {
    super.onInit();
    commentItems.value = ProjectInit().generateDummyComments();
    final arguments = Get.arguments;
    if (arguments != null && arguments is RouteArgumentsModel) {
      if (arguments.model != null) {
        model?.value = arguments.model!;
      }
      if (arguments.index != null) {
        index.value = arguments.index!;
      }
    }
  }
}

