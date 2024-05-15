

import '../../data/project_data.dart';
import 'init.dart';

class MainInit{
  void mainInit(){
    final ProjectInit projectInit = ProjectInit();
    ProjectData.init(ProjectData());
    projectInit.generateDummyProduct();
    projectInit.generateDummyPopularProductItems();
    projectInit.generateDummyFavoriteProductItems();
    projectInit.generateDummyShoppingCardProductItems();
  }
}