import 'package:Pazaryeri/product/extension/context/border_Radius.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/navigator/navigator_manager.dart';
import '../../../../product/utility/page_utility/product/product_detail_utility.dart';
import '../../../../product/utility/project_utility/image_utility.dart';
import '../../../../product/widget/custom_elevated_button.dart';
import '../../../../product/widget/general_shadow.dart';
import '../../../../product/widget/page_divider.dart';
import '../controller/product_detail_controller.dart';

part 'part/secure_name_widget.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});
  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView>
    with ProductDetailUtility {

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailController>().onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          init: ProductDetailController(),
          builder: (controller) {
            return ListView(
              children: [
                SizedBox(
                  height: context.sized.dynamicHeight(1.8),
                  //componentlerin total heightleri burda olmalı
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      //resim component
                      _buildImageContainerPlace(context, controller),
                      _buildProductContentPlace(context),
                      _buildProductPriceAndAddToCardPlace(context, controller),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Positioned _buildProductPriceAndAddToCardPlace(
      BuildContext context, ProductDetailController controller) {
    return Positioned(
      left: 0,
      right: 0,
      top: context.sized.dynamicHeight(0.905),
      child: Container(
        padding: context.padding.horizontalMedium,
        width: double.infinity,
        height: context.sized.dynamicHeight(0.9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: context.myBorder
              .dynamicBorderRadiusOnly(topRight: 0.08, topLeft: 0.08),
          boxShadow: [
            generalShadow(),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            amountAndAddToCard(context, controller),
            CustomPageDivider(),
            sellerInfoAndProductRating(context, controller),
            productCommentText(context),
            productCommentPlace(context, controller),
          ],
        ),
      ),
    );
  }

  Positioned _buildProductContentPlace(BuildContext context) {
    var backgroundDynamicHeight = context.sized.dynamicWidth(0.103);
    return Positioned(
      top: context.sized.dynamicHeight(0.6) - 35,
      child: Container(
        padding: context.padding.horizontalMedium,
        width: context.sized.width,
        height: context.sized.dynamicHeight(0.8),
        decoration: BoxDecoration(
          borderRadius: context.border.highBorderRadius,
          color: Colors.white,
        ),
        child: Padding(
          padding: context.padding.onlyTopMedium,
          child: SizedBox(
            height: context.sized.dynamicHeight(0.35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //iç kısmı
                productShopName(context),
                productNameAndCode(context,
                    textStyle: context.general.textTheme.titleMedium
                            ?.copyWith(color: Colors.grey) ??
                        const TextStyle()),
                productRating(context,
                    starSize: context.sized.dynamicHeight(0.02)),
                //ürün bilgisi content
                Padding(
                  padding: context.padding.onlyTopNormal,
                  child: const Text(
                      'Yüzünüze parlaklık ve nem verir. Sivilce akne oluşumunu önler. Üstelik içindeki C vitamini sayesinde vücudunuzun cilt bariyerini güçlendirir.'),
                ),
                //divider
                CustomPageDivider(),
                //adet bilgisi girme
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ADET',
                      style: context.general.textTheme.titleLarge,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        //backgroundContainer
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: context.border.lowBorderRadius,
                          ),
                          width: backgroundDynamicHeight * 4,
                          height: backgroundDynamicHeight,
                          child: Center(
                              child: Text(
                            '1',
                            style: context.general.textTheme.titleLarge,
                          )),
                        ),
                        quantityButton(context, text: "-", isLeft: true),
                        quantityButton(context, text: "+", isLeft: false)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildImageContainerPlace(
      BuildContext context, ProductDetailController controller) {
    var dynamicWidth = context.sized.dynamicWidth(0.1);
    return Container(
      width: context.sized.width,
      height: context.sized.dynamicHeight(0.6),
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
            image: AssetImage(ImageUtility.getImagePath(
                controller.model?.value.productUrl ?? "product")),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: context.padding.onlyTopHigh,
        child: Padding(
          padding: context.padding.horizontalMedium,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                  width: dynamicWidth,
                  height: dynamicWidth,
                  shape: RoundedRectangleBorder(
                      borderRadius: context.border.lowBorderRadius),
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    NavigatorController.instance.pop();
                  }),
              CustomElevatedButton(
                  width: dynamicWidth,
                  height: dynamicWidth,
                  shape: RoundedRectangleBorder(
                      borderRadius: context.myBorder
                          .dynamicBorderRadiusCircular(borderSize: 0.03)),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}