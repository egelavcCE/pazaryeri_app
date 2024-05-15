import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/navigator/navigator_manager.dart';
import '../../../../product/navigator/navigator_route_items.dart';
import '../../../../product/utility/page_utility/product/product_detail_utility.dart';
import '../../../../product/utility/page_utility/profile/favorite_utility.dart';
import '../../../../product/widget/general_search_bar.dart';
import '../../../../product/widget/general_shadow.dart';
import '../../../../product/widget/product_card_with_seller_info.dart';
import '../controller/shopping_card_controller.dart';

class ShoppingCardView extends StatelessWidget
    with ProductDetailUtility, FavoriteUtility {
  ShoppingCardView({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ShoppingCardController(),
      builder: (controller) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: customFloatActionButton(context,controller),
          body: SafeArea(
            child: Padding(
              padding: context.padding.horizontalNormal,
              child: ListView(
                children: [
                  GeneralSearchBar(),
                  buildProductCardLvb(context,controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  Padding buildProductCardLvb(BuildContext context,ShoppingCardController controller) {
    var dynamicCardHeight = context.sized.dynamicHeight(0.27);
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        height: (controller.shoppingCardProductItems?.length ?? 0.0) * dynamicCardHeight + context.sized.highValue,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.shoppingCardProductItems?.length,
          itemBuilder: (context, index) {
            return ProductCardWithSellerInfo(
              index: index,
              productModel: controller.shoppingCardProductItems?[index]
            );
          },
        ),
      ),
    );
  }


  Container customFloatActionButton(
    BuildContext context,
      ShoppingCardController cardController,
  ) {
    return Container(
      width: context.sized.width,
      height: context.sized.highValue,
      decoration: BoxDecoration(
          boxShadow: [generalShadow()],
          color: Colors.white,
          borderRadius: context.border.normalBorderRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$${getTotalPrice(cardController)}',
                  style: context.general.textTheme.titleLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text('Toplam Tutar',
                  style: context.general.textTheme.bodyMedium
                      ?.copyWith(color: Colors.grey)),
            ],
          ),
          buildProductDetailButton(context,
              width: context.sized.dynamicWidth(0.5),
              title: "Alışverişi tamamla",
              height: context.sized.dynamicHeight(0.07),
              textStyle: context.general.textTheme.titleMedium
                  ?.copyWith(color: Colors.white), onPressed: () {
                NavigatorController.instance.pushToPage(NavigateRoutesItems.payment);
              }),
        ],
      ),
    );
  }

  String getTotalPrice(ShoppingCardController controller){
    double totalPrice = 0.0;
    if(controller.shoppingCardProductItems?.isNotEmpty ?? false){
      for (var product in controller.shoppingCardProductItems!) {
        if (product.productPrice != null) {
          totalPrice += product.productPrice ?? 0.0;
        }
      }
    }
    return totalPrice.toString();
  }

}
