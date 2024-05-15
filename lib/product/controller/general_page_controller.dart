
import 'package:get/get.dart';
import '../model/product_model.dart';

enum PageType {
  home,
  search,
  searchResult
}

class GeneralPageController extends GetxController {
  var currentPage = PageType.home.obs;
  RxList<ProductModel> items = <ProductModel>[].obs;

  void showPage(PageType page, {List<ProductModel>? matchedProducts}) {
    currentPage.value = page;
    if(matchedProducts != null){
      items.value = matchedProducts;
      // items.assignAll(matchedProducts);
    }
    update();
  }
}