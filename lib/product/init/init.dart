
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/project_data.dart';
import '../../screen/product/product_detail/model/comment_model.dart';
import '../model/product_model.dart';

class ProjectInit extends GetxController{
  List<CommentModel> generateDummyComments() {
    return List.generate(10, (index) {
      return CommentModel(
        commentDate: '10-05-2024 08.37',
        commentID: index + 1,
        customerID: index % 3 + 1,
        comment: "Ürün kalitesi gerçekten harika, çok memnun kaldım. Ancak teslimat biraz uzun sürdü, daha hızlı olabilirdi. Genel olarak, üründen çok memnunum, tavsiye ederim.",
        starPoint: (index % 5) + 1,
      );
    });
  }

  void generateDummyProduct() {
    ProjectData.instance?.productItems = List.generate(10, (index) {
      return ProductModel(
        productBrand: "Nivea",
        productDate: "12.05.2024",
        productName: "Yüz Bakım Kremi",
        productPrice: 360.00,
        productUrl: "9",
        seller: "Furkan Yıldırım",
        productRating: "4.5",
      );
    });
  }

  void generateDummyPopularProductItems(){
    ProjectData.instance?.popularProductItems = List.generate(10, (index) {
      return ProductModel(
        productBrand: "Mavi",
        productDate: "13.05.2024",
        productName: "XXX Erkek Parfümü",
        productPrice: 500.00,
        productUrl: "product",
        seller: "Furkan Yıldırım",
        productRating: "4",
      );
    },);
  }

  void generateDummyFavoriteProductItems(){
    ProjectData.instance?.favoriteProductItems = List.generate(2, (index) {
      return ProductModel(
        productBrand: "Mavi",
        productDate: "13.05.2024",
        productName: "XXX Erkek Parfümü",
        productPrice: 500.00,
        productUrl: "product",
        seller: "Furkan Yıldırım",
        productRating: "4",
      );
    },);
  }

  void generateDummyShoppingCardProductItems(){
    ProjectData.instance?.shoppingCardProductItems = List.generate(4, (index) {
      return ProductModel(
        productBrand: "Mavi",
        productDate: "14.05.2024",
        productName: "XXX Erkek Parfümü",
        productPrice: 1000.00,
        productUrl: "product",
        seller: "Furkan Yıldırım",
        productRating: "4",
      );
    },);
  }
}
