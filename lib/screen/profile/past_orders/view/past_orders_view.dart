import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/color/project_color.dart';
import '../../../../product/model/product_model.dart';
import '../../../../product/navigator/navigator_manager.dart';
import '../../../../product/navigator/navigator_route_items.dart';
import '../../../../product/utility/page_utility/profile/favorite_utility.dart';
import '../../../../product/widget/general_app_bar.dart';
import '../../../../product/widget/general_search_bar.dart';
import '../../../../product/widget/product_card_with_seller_info.dart';

class PastOrdersView extends StatelessWidget with FavoriteUtility {
  const PastOrdersView({super.key});

  final int pastOrdersItemCount = 2;

  @override
  Widget build(BuildContext context) {
    final ProductModel productModel = ProductModel(
        productUrl: "9",
        productBrand: "Nivea",
        productPrice: 300,
        productDate: "11.05.2024",
        seller: "XXXXXX",
        productRating: "4.7",
        productName: "XXX Erkek Parfüm");
    return Scaffold(
      appBar: GeneralAppBar(
        textColor: ProjectColor.apricot.getColor(),
        isLeadingActive: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalNormal,
          child: ListView(
            children: [
              GeneralSearchBar(),
              Container(
                margin: context.padding.onlyTopNormal,
                width: double.infinity,
                height: context.sized.dynamicHeight(0.268) * pastOrdersItemCount,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pastOrdersItemCount,
                  itemBuilder: (context, index) {
                    return ProductCardWithSellerInfo(
                      index: index,
                      productModel: productModel,
                      topPlace: _buildTopPlace(context, productModel),
                      buttons: [
                        buildProductFavoriteCardPropertyButton(context,
                            onPressed: () {
                              NavigatorController.instance.pushToPage(NavigateRoutesItems.orderDetail,arguments: productModel);
                            },
                            text: "Detaylar",
                            textColor: Colors.white,
                            backgroundColor: ProjectColor.apricot.getColor())
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTopPlace(BuildContext context, ProductModel productModel) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: context.padding.horizontalNormal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productModel.productDate ?? ""),
              Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: context.padding.onlyLeftLow,
                    child: Text(
                      'Teslim edildi',
                      style: context.general.textTheme.bodyMedium?.copyWith(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
