import 'package:Pazaryeri/product/model/route_arguments_model.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../color/project_color.dart';
import '../model/product_model.dart';
import '../navigator/navigator_manager.dart';
import '../navigator/navigator_route_items.dart';
import '../utility/project_utility/image_utility.dart';

class ProductCardWidgetSearchResult extends StatelessWidget {
  const ProductCardWidgetSearchResult({
    super.key, this.model,
  });
  final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        NavigatorController.instance.pushToPage(NavigateRoutesItems.productDetail,arguments: RouteArgumentsModel(model: model));
      },
      child: Container(
        padding: EdgeInsets.all(context.sized.lowValue),
        margin: EdgeInsets.all(context.sized.lowValue),
        decoration: BoxDecoration(
          borderRadius: context.border.normalBorderRadius,
          boxShadow: const [BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 2,
          )],
          color: ProjectColor.lightGrey.getColor(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: context.border.normalBorderRadius,
                  image: DecorationImage(image: AssetImage(ImageUtility.getImagePath("9")),fit: BoxFit.fitWidth)
              ),
              width: double.infinity,
              height: context.sized.dynamicHeight(0.2),
            ),
            Padding(
              padding: context.padding.onlyTopLow,
              child: Text("${model?.productName}"),
            ),
            Text("${model?.productPrice}",style: context.general.textTheme.bodyMedium?.copyWith(color: ProjectColor.apricot.getColor()),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(context.sized.dynamicWidth(0.01)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: context.border.lowBorderRadius,
                      boxShadow: const [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        offset: Offset(0, 1),
                      )]
                  ),
                  child: Text('Kargo Bedava',style:
                  context.general.textTheme.bodySmall,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}