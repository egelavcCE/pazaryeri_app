

import '../product/model/product_model.dart';

class ProjectData{
  static ProjectData? _instance;
  static void init(ProjectData instance){
    _instance ??= instance;
  }

  static ProjectData? get instance{
    if(_instance != null) return _instance;
    throw Exception("Instance has not initialize");
  }

  List<ProductModel> productItems = [];
  List<ProductModel> popularProductItems = [];
  List<ProductModel> favoriteProductItems = [];
  List<ProductModel> shoppingCardProductItems = [];
}

