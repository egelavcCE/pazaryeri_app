import 'package:Pazaryeri/product/model/route_arguments_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../color/project_color.dart';
import '../model/product_model.dart';
import '../navigator/navigator_manager.dart';
import '../navigator/navigator_route_items.dart';
import '../utility/project_utility/image_utility.dart';
import 'custom_elevated_button.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key, this.model, required this.index,
  });
  final ProductModel? model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed:() {
      NavigatorController.instance.pushToPage(NavigateRoutesItems.productDetail, arguments: RouteArgumentsModel(index: index,model: model));
    },
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: context.border.lowBorderRadius,
      ),
      backgroundColor: Colors.grey[200],
      padding: EdgeInsets.all(context.sized.lowValue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductImage(context),
          _buildProductTitleText(context),
          _buildPriceText(context),
        ],
      ),
    );
  }

  Expanded _buildProductImage(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: context.border.lowBorderRadius,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              ImageUtility.getImagePath("9"),
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildProductTitleText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Text("XXX Erkek Vücut Parfümü",
          style: context.general.textTheme.bodySmall),
    );
  }

  Padding _buildPriceText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "\$99",
            style: context.general.textTheme.bodyMedium?.copyWith(
                color: ProjectColor.apricot.getColor(),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
