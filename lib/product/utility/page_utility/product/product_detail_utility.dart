import 'package:Pazaryeri/product/extension/context/border_Radius.dart';
import 'package:Pazaryeri/screen/profile/favorite/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../screen/product/product_detail/controller/product_detail_controller.dart';
import '../../../../screen/product/product_detail/model/comment_model.dart';
import '../../../../screen/product/product_detail/view/product_detail_view.dart';
import '../../../../screen/profile/shopping_card/controller/shopping_card_controller.dart';
import '../../../color/project_color.dart';
import '../../../controller/product_widget_controller/added_to_card_controller.dart';
import '../../../navigator/navigator_manager.dart';
import '../../../navigator/navigator_route_items.dart';
import '../../../widget/custom_elevated_button.dart';
import '../../../widget/page_divider.dart';
import '../../project_utility/image_utility.dart';

mixin ProductDetailUtility {
  final ProductDetailController controller = Get.put(ProductDetailController());
  Container sellerProfileContainer(
    BuildContext context, {
    String? url,
  }) {
    return Container(
      margin: context.padding.onlyRightNormal,
      height: context.sized.dynamicHeight(0.11),
      width: context.sized.dynamicHeight(0.11),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: context.border.normalBorderRadius,
        image: url != null
            ? DecorationImage(image: AssetImage(url), fit: BoxFit.cover)
            : null,
      ),
    );
  }

  Text productNameAndCode(BuildContext context,
          {required TextStyle textStyle}) =>
      Text(
        '${controller.model?.value.productName} PZ5354686',
        style: textStyle,
      );

  Text productShopName(BuildContext context) => Text(
    controller.model?.value.productBrand ?? "",
        style: context.general.textTheme.titleLarge,
      );

  Row productRating(BuildContext context, {required double starSize}) {
    return Row(
      children: [
        //total star average
        Container(
          margin: context.padding.onlyRightLow,
          padding: context.padding.horizontalLow,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: context.border.lowBorderRadius,
          ),
          child: Text(
            controller.model?.value.productRating ?? "",
            style: context.general.textTheme.titleMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
        //star point
        buildStarPoint(starSize),
        //divider
        buildVerticalDivider(context, starSize),
        //değerlendirme
        Text(
          '1234 Değerlendirme',
          style: context.general.textTheme.labelSmall?.copyWith(
              color: Colors.grey, fontSize: context.sized.dynamicWidth(0.025)),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Container buildVerticalDivider(BuildContext context, double starSize) {
    return Container(
      margin: context.padding.horizontalLow,
      width: 2,
      height: starSize * 1.5,
      color: Colors.black54,
    );
  }

  SizedBox buildStarPoint(double starSize) {
    return SizedBox(
      width: starSize * 5,
      height: starSize,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Icon(
            Icons.star,
            size: starSize,
            color:
                index == 4 ? Colors.grey : ProjectColor.starYellow.getColor(),
          );
        },
      ),
    );
  }

  Positioned quantityButton(
    BuildContext context, {
    bool? isLeft,
    required String text,
  }) {
    return Positioned(
      top: 0,
      left: (isLeft ?? false) ? 0 : null,
      right: (isLeft ?? false) ? null : 0,
      child: CustomElevatedButton(
        shape: RoundedRectangleBorder(
            borderRadius: context.border.lowBorderRadius),
        onPressed: () {},
        width: context.sized.dynamicHeight(0.06),
        height: context.sized.dynamicHeight(0.06),
        child: Text(
          text,
          style: context.general.textTheme.titleLarge,
        ),
      ),
    );
  }

  Column buildCommentWithDivider(BuildContext context, int index,
      {required List<CommentModel> commentItems}) {
    return Column(
      children: [
        Container(
          margin: context.padding.onlyTopNormal,
          height: context.sized.dynamicHeight(0.13),
          child: Column(
            children: [
              Row(
                children: [
                  buildStarPoint(context.sized.dynamicHeight(0.015)),
                  buildVerticalDivider(
                      context, context.sized.dynamicHeight(0.015)),
                  const SecureNameWidget(name: "Furkan Yıldırım"),
                  Padding(
                    padding: context.padding.horizontalNormal,
                    child: Text(
                      '-',
                      style: context.general.textTheme.titleLarge,
                    ),
                  ),
                  Text(commentItems[index].commentDate,
                      style: context.general.textTheme.labelLarge),
                ],
              ),
              Padding(
                padding: context.padding.onlyTopLow,
                child: Text(
                  commentItems[index].comment,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        CustomPageDivider(),
      ],
    );
  }

  Column buildSellerAndProductInfo(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.padding.onlyTopNormal,
          child: Row(
            children: [
              sellerProfileContainer(context,
                  url: ImageUtility.getImagePath(
                      controller.model?.value.productUrl ?? "product")),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productShopName(context),
                  productNameAndCode(context,
                      textStyle: context.general.textTheme.titleSmall
                              ?.copyWith(color: Colors.grey) ??
                          const TextStyle()),
                  productRating(
                    context,
                    starSize: context.sized.dynamicHeight(0.015),
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomPageDivider(),
      ],
    );
  }

  Column productCommentPlace(
      BuildContext context, ProductDetailController controller) {
    return Column(
      children: [
        Container(
          padding: context.padding.horizontalNormal,
          margin: context.padding.onlyTopNormal,
          width: context.sized.width,
          height: context.sized.dynamicHeight(0.5),
          decoration: BoxDecoration(
              color: ProjectColor.lightGrey.getColor(),
              borderRadius: context.myBorder
                  .dynamicBorderRadiusOnly(topLeft: 0.1, topRight: 0.1)),
          child: Column(
            children: [
              //Satıcı ve ürün ön bilgisi değerlendirmeler için
              buildSellerAndProductInfo(context),
              //yorumlar ilk 2
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    //yorum bileşeni
                    return buildCommentWithDivider(context, index,
                        commentItems: controller.commentItems);
                  },
                ),
              ),
            ],
          ),
        ),
        CustomElevatedButton(
          width: double.infinity,
          shape: RoundedRectangleBorder(
            borderRadius: context.myBorder.dynamicBorderRadiusOnly(
              bottomRight: 0.1,
              bottomLeft: 0.1,
            ),
          ),
          child: Text(
            'Tümünü Gör (543)',
            style: context.general.textTheme.titleMedium
                ?.copyWith(color: ProjectColor.apricot.getColor()),
          ),
          onPressed: () {
            NavigatorController.instance.pushToPage(NavigateRoutesItems.allComment,arguments: controller.commentItems);
          },
        ),
      ],
    );
  }

  Padding productCommentText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: Text(
        'Ürün Değerlendirmeleri',
        style: context.general.textTheme.titleMedium,
      ),
    );
  }

  Container sellerInfoAndProductRating(
      BuildContext context, ProductDetailController controller) {
    return Container(
      margin: context.padding.onlyTopNormal,
      height: context.sized.dynamicHeight(0.11),
      width: context.sized.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //satıcı profile kutusu
          sellerProfileContainer(context),
          //Satıcı bilgisi ve ürün rating
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${controller.model?.value.seller} / Satıcı',
                style: context.general.textTheme.titleMedium,
              ),
              productRating(context,
                  starSize: context.sized.dynamicHeight(0.02)),
            ],
          ),
        ],
      ),
    );
  }

  Padding amountAndAddToCard(
      BuildContext context, ProductDetailController controller) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${controller.model?.value.productPrice}",
                style: context.general.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                'Toplam Tutar',
                style: context.general.textTheme.titleSmall
                    ?.copyWith(color: Colors.grey),
              )
            ],
          ),
          CustomElevatedButton(
            width: context.sized.dynamicWidth(0.45),
            height: context.sized.dynamicHeight(0.07),
            onPressed: () {
              final ShoppingCardController shoppingCardController = Get.put(ShoppingCardController());
              final FavoriteController favoriteController = Get.put(FavoriteController());
              shoppingCardController.addProductToShoppingCard(favoriteController.favoriteProductItems?[controller.index.value]);
              AlertController().showAlert(isProductDetail: true);
            },
            shape: RoundedRectangleBorder(
                borderRadius: context.myBorder
                    .dynamicBorderRadiusCircular(borderSize: 0.04)),
            backgroundColor: ProjectColor.apricot.getColor(),
            child: Text(
              'Sepete ekle',
              style: context.general.textTheme.titleLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
