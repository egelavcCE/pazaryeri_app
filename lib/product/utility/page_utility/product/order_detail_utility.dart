

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../screen/main_page/controller/main_page_controller.dart';
import '../../../color/project_color.dart';
import '../../../model/product_model.dart';
import '../../../widget/page_divider.dart';
import '../../project_utility/image_utility.dart';

mixin OrderDetailUtility{
  final MainPageController controller = Get.put(MainPageController());


  Container buildOrderSummary(BuildContext context) {
    return Container(
      margin: context.padding.onlyTopNormal,
      padding: EdgeInsets.all(context.sized.normalValue),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: context.border.normalBorderRadius,
        border: Border.all(color: Colors.black26, width: 1),
      ),
      width: double.infinity,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sipariş No: 224507753',
            style: buildBodyLarge(context),
          ),
          Text('Sipariş Tarihi: 14.05.2024', style: buildBodyLarge(context)),
          Row(
            children: [
              Text('Sipariş Özeti: ', style: buildBodyLarge(context)),
              Text('1 Teslimat, ',
                  style: buildBodyLarge(context, color: Colors.green)),
              Text('1 Ürün', style: buildBodyLarge(context)),
            ],
          ),
          Row(
            children: [
              Text('Sipariş Detayı: ', style: buildBodyLarge(context)),
              Text('1 Ürün Teslim Edildi',
                  style: buildBodyLarge(context, color: Colors.green)),
            ],
          ),
          Row(
            children: [
              Text('Toplam: ', style: buildBodyLarge(context)),
              Text('399.00 TL',
                  style: buildBodyLarge(context,
                      color: ProjectColor.apricot.getColor())),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle? buildBodyLarge(BuildContext context, {Color? color}) =>
      context.general.textTheme.bodyLarge
          ?.copyWith(color: color, fontWeight: FontWeight.w500);

  Padding buildIconAndText(
      BuildContext context, {
        required String text,
        required IconData icon,
      }) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: Row(
        children: [
          Padding(
            padding: context.padding.onlyRightLow,
            child: Icon(
              icon,
              color: ProjectColor.apricot.getColor(),
            ),
          ),
          Text(
            text,
            style: buildBodyLarge(context),
          ),
        ],
      ),
    );
  }

  Container buildOrderAddressCard(BuildContext context) {
    return Container(
      padding: context.padding.horizontalNormal,
      margin: context.padding.onlyTopNormal,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: context.border.normalBorderRadius,
        border: Border.all(color: Colors.black26, width: 1),
      ),
      height: context.sized.dynamicHeight(0.28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildIconAndText(context, text: "Teslimat Adresi", icon: Icons.location_on_outlined),
          Expanded(
            child: Padding(
              padding: context.padding.onlyLeftMedium,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Alıcı: Furkan Yıldırım',style: buildBodyLarge(context),),
                  Text('Örnekköy Mah. Önrkeköy Sok. Örnekköy Apt. No:34 Kadıköy/İstanbul',style: buildBodyLarge(context),),
                  Text('Örnekköy Mah/Kadıköy/İstanbul',style: buildBodyLarge(context),),
                  Text('506*****34',style: buildBodyLarge(context),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildPaymentInfo(BuildContext context,ProductModel? model) {
    var dynamicSize = context.sized.dynamicWidth(0.08);
    return Container(
      padding: context.padding.horizontalNormal,
      margin: context.padding.onlyTopNormal,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: context.border.normalBorderRadius,
        border: Border.all(color: Colors.black26, width: 1),
      ),
      height: context.sized.dynamicHeight(0.28),
      child: Column(
        children: [
          Row(
            children: [
              buildIconAndText(context,
                  text: "Ödeme Bilgileri",
                  icon: Icons.border_color_outlined),
              Padding(
                padding: context.padding.onlyLeftLow,
                child: Image.asset(
                  ImageUtility.getImagePath("master"),
                  width: dynamicSize,
                  height: dynamicSize,
                ),
              ),
              Text(
                '**** ****9608 - Tek Çekim',
                style: _buildLabelLarge(context, color: Colors.grey),
              ),
            ],
          ),
          buildDoubleText(context,
              textOne: "Ara Toplam", textTwo: model?.productPrice.toString() ?? ""),
          buildDoubleText(context,
              textOne: "Kargo", textTwo: "29.00 TL"),
          buildDoubleText(context,
              textOne:
              "150 TL ve Üzeri Kargo Bedava(Satıcı Karşılar)",
              textTwo: "-29.00 TL"),
          CustomPageDivider(),
          buildDoubleText(context,
              textOne: "Toplam:",
              textTwo: model?.productPrice.toString() ?? "",
              color: ProjectColor.apricot.getColor())
        ],
      ),
    );
  }

  Container buildSellingContract(BuildContext context) {
    return Container(
      padding: context.padding.horizontalNormal,
      margin: context.padding.onlyTopNormal,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: context.border.normalBorderRadius,
        border: Border.all(color: Colors.black26, width: 1),
      ),
      height: context.sized.dynamicHeight(0.07),
      child: Column(
        children: [
          buildIconAndText(context, text: "Mesafeli Satış Sözleşmesi", icon: Icons.comment_outlined),
        ],
      ),
    );
  }

  Padding buildDoubleText(
      BuildContext context, {
        required String textOne,
        required String textTwo,
        Color? color,
      }) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(textOne),
          Text(
            textTwo,
            style: _buildLabelLarge(context, color: color ?? Colors.grey),
          ),
        ],
      ),
    );
  }

  TextStyle? _buildLabelLarge(BuildContext context,
      {Color? color, FontWeight? fontWeight}) =>
      context.general.textTheme.labelLarge
          ?.copyWith(color: color, fontWeight: fontWeight);

}