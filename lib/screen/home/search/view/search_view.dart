import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/controller/product_widget_controller/general_search_bar_controller.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final GeneralSearchBarController generalSearchBarController =
      Get.put(GeneralSearchBarController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.horizontalNormal,
      child: Container(
        width: context.sized.width,
        margin: context.padding.onlyTopNormal,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: context.border.normalBorderRadius,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 1, offset: Offset(-1, 1))],
          color: Colors.white,
        ),
        constraints:
            BoxConstraints(maxHeight: context.sized.dynamicHeight(0.6)),
        child: Obx(
          () => ListView.builder(
            itemCount: generalSearchBarController.searchedWords.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: context.padding.horizontalLow,
                child: Column(
                  children: [
                    Row(
                      children: [
                        _buildDeleteIconButton(index),
                        _buildSearchedWordText(context, index),
                      ],
                    ),
                    _buildDivider(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
    );
  }

  Padding _buildSearchedWordText(BuildContext context, int index) {
    return Padding(
      padding: context.padding.onlyLeftLow,
      child: GestureDetector(
        onTap: (){
          generalSearchBarController.onSubmitted(generalSearchBarController.searchedWords[index]);
        },
        child: Container(
          width: context.sized.dynamicWidth(0.68),
          height: context.sized.dynamicHeight(0.05),
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              generalSearchBarController.searchedWords[index],
              style: context.general.textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }

  IconButton _buildDeleteIconButton(int index) {
    return IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        generalSearchBarController.delete(index);
      },
    );
  }
}
