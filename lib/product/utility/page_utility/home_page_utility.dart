import 'package:Pazaryeri/screen/home/home_page/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../screen/home/search/view/search_view.dart';
import '../../../screen/home/search_result/view/search_result_view.dart';
import '../../../screen/unknown_page/view/unknown_view.dart';
import '../../color/project_color.dart';
import '../../controller/general_page_controller.dart';
import '../../navigator/navigator_manager.dart';
import '../../navigator/navigator_route_items.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/my_slider.dart';
import '../../widget/product_card_widget.dart';
import '../project_utility/image_utility.dart';

mixin HomePageViewUtility {
  final GeneralPageController generalPageController = Get.put(GeneralPageController());

  Widget selectAndShowPage(BuildContext context) {
    switch (generalPageController.currentPage.value) {
      case PageType.home:
        return buildHomePageContent(context);
      case PageType.search:
        return SearchView();
      case PageType.searchResult:
        return SearchResultView(productItems: generalPageController.items,);
      default:
        return const UnknownView();
    }
  }

  GetBuilder buildHomePageContent(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) => Column(
        children: [
          buildBlackFridaySlider(context),
          buildGridViewSpecialSuggestion(context),
          buildInfluencerSuggestionLvb(context),
          buildBigSaleContainer(context),
          popularProductGirdView(context, controller),
        ],
      ),
    );
  }

  Container popularProductGirdView(BuildContext context,HomePageController homePageController) {
    return Container(
      decoration: BoxDecoration(borderRadius: context.border.lowBorderRadius),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popüler Olanlar",
                style: context.general.textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Hepsini Gör",
                  style: context.general.textTheme.bodyMedium?.copyWith(color: ProjectColor.apricot.getColor()),
                ),
              ),
            ],
          ),
          Padding(
            padding: context.padding.onlyTopLow,
            child: SizedBox(
              width: double.infinity,
              height: context.sized.dynamicHeight(0.217) * ((homePageController.popularProductItems.length) / 2),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3,
                children: List.generate(homePageController.popularProductItems.length, (index) {
                  return ProductCardWidget(
                    model: homePageController.popularProductItems[index], index: index,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildInfluencerSuggestionLvb(BuildContext context) {
    return Container(
      margin: context.padding.onlyTopNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Influencer Önerileri",
              style: context.general.textTheme.titleMedium),
          Container(
            margin: context.padding.onlyTopLow,
            height: context.sized.dynamicHeight(0.12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 9 ? EdgeInsets.zero : context.padding.onlyRightNormal,
                  child: buildInfluencerSuggestionCard(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildInfluencerSuggestionCard(BuildContext context) {
    var dynamicSize = context.sized.dynamicWidth(0.155);
    var kZero = 0.0;
    return GestureDetector(
      onTap: (){
        NavigatorController.instance.pushToPage(NavigateRoutesItems.influencerSuggestion);
      },
      child: Stack(
        children: [
          Container(
            width: dynamicSize,
            height: dynamicSize,
            decoration: BoxDecoration(
              borderRadius: context.border.lowBorderRadius,
              border: Border.all(
                color: ProjectColor.apricot.getColor(),
                width: 2,
              ),
              image: DecorationImage(image: AssetImage(
                ImageUtility.getImagePath("6"),
              ),fit: BoxFit.cover,
              )
            ),
          ),
          Positioned(
            top: kZero,
            right: kZero,
            child: const Icon(
              Icons.check_circle,
              color: Colors.blue,
            ),
          ),
          Positioned(
            bottom: kZero,
            left: kZero,
            right: kZero,
            child: Text("Chris Path",
                textAlign: TextAlign.center,
                style: context.general.textTheme.bodyMedium),
          )
        ],
      ),
    );
  }

  Padding buildGridViewSpecialSuggestion(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        height: context.sized.dynamicHeight(0.121),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 5,
              mainAxisSpacing: context.sized.normalValue,
              crossAxisSpacing: context.sized.mediumValue),
          itemBuilder: (context, index) {
            return buildSpecialSuggestionCard(context);
          },
        ),
      ),
    );
  }

  CustomElevatedButton buildSpecialSuggestionCard(BuildContext context) {
    return CustomElevatedButton(
        shape: RoundedRectangleBorder(
            borderRadius: context.border.normalBorderRadius,
            side: const BorderSide(width: 1, color: Colors.black12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: context.padding.onlyLeftLow,
              child: Image.asset(
                ImageUtility.getImagePath("4"),
                height: context.sized.mediumValue,
                width: context.sized.mediumValue,
              ),
            ),
            Padding(
              padding: context.padding.onlyLeftNormal,
              child: const Text('Sana Ozel'),
            ),
          ],
        ),
        onPressed: () {});
  }

  Padding buildBlackFridaySlider(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        height: context.sized.dynamicHeight(0.2),
        child: MySlider(),
      ),
    );
  }

  Padding buildBigSaleContainer(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColor.apricot.getColor(),
          borderRadius: context.border.normalBorderRadius,
        ),
        padding: context.padding.horizontalNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.padding.onlyTopNormal,
              child: Text(
                  "Büyük İndirimler",
                  style: context.general.textTheme.titleMedium?.copyWith(
                      color: Colors.white
                  )
              ),
            ),
            Container(
              margin: context.padding.onlyBottomNormal,
              height: context.sized.dynamicHeight(0.16),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff7d0102),
                      Color(0xff322b39),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: context.border.normalBorderRadius
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text("%50",
                              style: context.general.textTheme.headlineLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w600,)
                          ),
                          Text("İNDİRİM",
                              style: context.general.textTheme.headlineLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w600,)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        buildSaleProductCard(context, image: '9'),
                        buildSaleProductCard(context, image: "8"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildSaleProductCard(BuildContext context,{required String image}) {
    var dynamicSize = context.sized.dynamicWidth(0.16);
    var lowBorderRadius2 = context.border.lowBorderRadius;
    return Container(
      width: dynamicSize,
      height: dynamicSize,
      decoration: BoxDecoration(
        borderRadius: lowBorderRadius2,
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: lowBorderRadius2,
        child: Image.asset(
          ImageUtility.getImagePath(image),
          width: dynamicSize,
          height: dynamicSize,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
