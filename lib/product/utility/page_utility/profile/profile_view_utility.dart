import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../color/project_color.dart';
import '../../../navigator/navigator_manager.dart';
import '../../../navigator/navigator_route_items.dart';
import '../../../widget/custom_elevated_button.dart';
import '../../../widget/page_divider.dart';
import '../../project_utility/image_utility.dart';

mixin ProfileViewUtility {
  final List<NavigateRoutesItems> pages = [
    NavigateRoutesItems.wallet,
    NavigateRoutesItems.pastOrders,
    NavigateRoutesItems.addresses,
    NavigateRoutesItems.creditCard,
    NavigateRoutesItems.accountSettings,
    NavigateRoutesItems.checkOut,
  ];

  Positioned buildGeneralProfileContainer(
    BuildContext context,
  ) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Column(
        children: [
          Container(
            padding: context.padding.horizontalMedium,
            width: double.infinity,
            height: context.sized.dynamicHeight(0.84),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: context.border.normalBorderRadius),
            child: Column(
              children: [
                buildProfileContainer(context),
                buildProfileContentListViewBuilder(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildProfileContentListViewBuilder() {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomPageDivider(padding: EdgeInsets.zero),
              buildProfileContentItemsButton(context, index: index),
            ],
          );
        },
      ),
    );
  }

  Container buildProfileContainer(BuildContext context) {
    return Container(
      margin: context.padding.onlyTopMedium,
      padding: context.padding.verticalMedium,
      child: Row(
        children: [
          //profilePhoto
          CircleAvatar(
            maxRadius: context.sized.dynamicHeight(0.05),
            backgroundImage: AssetImage(ImageUtility.getImagePath("profile_photo")),
          ),
          Padding(
            padding: context.padding.onlyLeftMedium,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Leyla Kaya",
                  style: context.general.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Premium',
                  style: context.general.textTheme.titleSmall
                      ?.copyWith(color: ProjectColor.midBrown.getColor()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildProfileContentItemsButton(
    BuildContext context, {
    required int index,
  }) {
    return Padding(
      padding: context.padding.verticalLow,
      child: CustomElevatedButton(
        onPressed: () {
          _navigateToPage(context, index);
        },
        height: context.sized.dynamicHeight(0.06),
        elevation: 0,
        backgroundColor: Colors.transparent,
        width: context.sized.width,
        child: Row(
          children: [
            Padding(
              padding: context.padding.onlyRightMedium,
              child: Icon(
                pages[index].getIcon(),
                size: context.sized.mediumValue,
                color: ProjectColor.midBrown.getColor(),
              ),
            ),
            Text(
              pages[index].getLabel(),
              style: context.general.textTheme.bodyLarge?.copyWith(
                  color: ProjectColor.midBrown.getColor(),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  LinearGradient buildBackgroundLinearGradient() {
    return const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFFDAC6B5),
        Color(0xFFb59376),
      ],
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    if(index == pages.length -1){
      NavigatorController.instance.pushAndRemoveUntil(pages[index]);
    }
    else{
      NavigatorController.instance.pushToPage(pages[index]);
    }
  }
}

extension ProfileLvbItemsExtension on NavigateRoutesItems {
  String getLabel() => {
        NavigateRoutesItems.wallet: 'Cüzdanım',
        NavigateRoutesItems.pastOrders: 'Geçmiş Siparişlerim',
        NavigateRoutesItems.addresses: 'addreslerim',
        NavigateRoutesItems.creditCard: 'Kartlarım',
        NavigateRoutesItems.accountSettings: 'Hesap Ayarları',
        NavigateRoutesItems.checkOut: 'Çıkış Yap',
      }[this]!;

  IconData getIcon() => {
        NavigateRoutesItems.wallet: Icons.account_balance_wallet,
        NavigateRoutesItems.pastOrders: Icons.history,
        NavigateRoutesItems.addresses: Icons.location_on,
        NavigateRoutesItems.creditCard: Icons.credit_card,
        NavigateRoutesItems.accountSettings: Icons.settings,
        NavigateRoutesItems.checkOut: Icons.shopping_cart,
      }[this]!;
}
