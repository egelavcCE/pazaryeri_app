import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../color/project_color.dart';
import '../controller/general_page_controller.dart';
import '../controller/product_widget_controller/general_search_bar_controller.dart';

class GeneralSearchBar extends StatelessWidget {
  GeneralSearchBar({super.key});
  final GeneralPageController generalPageController = Get.put(GeneralPageController());
  final GeneralSearchBarController searchBarController = Get.put(GeneralSearchBarController());

  final String hintText = "İstediğiniz ürünü ve kategoriyi aratabilirsiniz";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: GestureDetector(
        onTap: (){
          _switchToSearchPage();
        },
        child: GetBuilder<GeneralSearchBarController>(
          init: GeneralSearchBarController(),
          builder: (searchBarController) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: context.sized.dynamicHeight(0.06),
                    decoration: _buildMainContainerDecoration(context),
                    child: Row(
                      children: [
                        _buildSearchIcon(context, searchController: searchBarController),
                        _buildSearchBarTextField(context, searchBarController),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _switchToSearchPage() {
    if(generalPageController.currentPage.value == PageType.home){
      searchBarController.changeClicked();
      generalPageController.showPage(PageType.search);
    }
  }

  Expanded _buildSearchBarTextField(
      BuildContext context, GeneralSearchBarController controller) {
    return Expanded(
      child: Padding(
        padding: context.padding.onlyLeftNormal,
        child: Padding(
          padding: context.padding.onlyBottomLow,
          child: TextField(
            onTap: (){
              _switchToSearchPage();
            },
              textAlignVertical: TextAlignVertical.center,
              controller: controller.getSearchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: context.general.textTheme.titleSmall?.copyWith(
                    color: Colors.black54,
                  )),
              onSubmitted: controller.onSubmitted),
        ),
      ),
    );
  }

  BoxDecoration _buildMainContainerDecoration(BuildContext context) {
    return BoxDecoration(
      color: ProjectColor.lightGrey.getColor(),
      border: Border.all(color: Colors.black26),
      borderRadius: context.border.normalBorderRadius,
    );
  }

  Padding _buildSearchIcon(BuildContext context,
      {required GeneralSearchBarController searchController}) {
    return Padding(
      padding: context.padding.onlyLeftNormal,
      child: IconButton(
        onPressed: (){
          _iconButtonOnPressed(searchController);
        },
        icon: Icon(
          searchController.isClicked.value ? Icons.arrow_back_outlined : Icons.search,
          color: ProjectColor.apricot.getColor(),
        ),
      ),
    );
  }

  void _iconButtonOnPressed(GeneralSearchBarController searchController) {
    switch(generalPageController.currentPage.value){
      case PageType.home:
        searchBarController.changeClicked();
        generalPageController.showPage(PageType.search);
      case PageType.search:
        searchController.changeClicked();
        generalPageController.showPage(PageType.home);
      case PageType.searchResult:
        searchController.changeClicked();
        generalPageController.showPage(PageType.home);
    }
  }
}
