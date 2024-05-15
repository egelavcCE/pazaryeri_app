import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../color/project_color.dart';
import '../../../model/product_model.dart';
import '../../../widget/custom_elevated_button.dart';
import '../../project_utility/image_utility.dart';

mixin FavoriteUtility {
  Padding buildProductDetailButton(
    BuildContext context, {
    required double width,
    required String title,
    double? height,
    TextStyle? textStyle,
        required void Function() onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.all(context.sized.lowValue),
      child: CustomElevatedButton(
        height: height,
        width: width,
        shape: RoundedRectangleBorder(
            borderRadius: context.border.normalBorderRadius),
        backgroundColor: ProjectColor.apricot.getColor(),
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle ??
              context.general.textTheme.titleSmall
                  ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  SizedBox buildProductDetailWithoutButton(
      {required BuildContext context,
      required int index,
      List<Widget>? buttons,
      ProductModel? model}) {
    return SizedBox(
      height: context.sized.dynamicHeight(0.18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: context.padding.onlyRightLow,
            width: context.sized.dynamicWidth(0.3),
            height: context.sized.dynamicWidth(0.3),
            child: Container(
              margin: EdgeInsets.all(context.sized.lowValue),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      ImageUtility.getImagePath(model?.productUrl ?? "9")),
                  fit: BoxFit.cover,
                ),
                borderRadius: context.border.normalBorderRadius,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: context.padding.onlyTopNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model?.productName ?? "",
                      style: context.general.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  Text(model?.productBrand ?? ""),
                  Text("${model?.productPrice} TL",
                      style: context.general.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ProjectColor.apricot.getColor())),
                  Padding(
                    padding: context.padding.onlyTopNormal,
                    child: Row(
                      mainAxisAlignment: buttons != null ? MainAxisAlignment.end : MainAxisAlignment.spaceBetween,
                      children: buttons ??
                          [
                            buildProductFavoriteCardPropertyButton(context,
                                onPressed: () {}, text: "Kargo Bedava"),
                            buildProductFavoriteCardPropertyButton(context,
                                onPressed: () {}, text: "Hızlı Teslimat"),
                          ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  CustomElevatedButton buildProductFavoriteCardPropertyButton(
    BuildContext context, {
    required void Function() onPressed,
    required String text,
    Color? textColor,
    Color? backgroundColor,
  }) {
    return CustomElevatedButton(
      onPressed: onPressed,
      height: context.sized.mediumValue,
      backgroundColor: backgroundColor,
      width: context.sized.dynamicWidth(0.28),
      shape: RoundedRectangleBorder(
        borderRadius: context.border.normalBorderRadius,
      ),
      child: Text(text,
          style: context.general.textTheme.labelLarge
              ?.copyWith(fontWeight: FontWeight.w400, color: textColor)),
    );
  }
}
