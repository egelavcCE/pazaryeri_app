import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/color/project_color.dart';
import '../../../product/utility/page_utility/profile/profile_view_utility.dart';
import '../../../product/widget/custom_bottom_nav_bar.dart';
import '../../../product/widget/general_app_bar.dart';
import '../../home/home_page/view/home_page_view.dart';
import '../../profile/favorite/view/favorite_view.dart';
import '../../profile/profile_page/view/profile_View.dart';
import '../../profile/shopping_card/view/shopping_card_view.dart';
import '../controller/main_page_controller.dart';

class MainPageView extends StatelessWidget with ProfileViewUtility{
  MainPageView({super.key});
  final MainPageController controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: buildBackgroundLinearGradient(),
        ),
        child: CustomBottomNavBar(controller: controller),
      ),
      appBar: GeneralAppBar(textColor: ProjectColor.apricot.getColor(),),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.getPageController,
        onPageChanged: controller.onPageChanged,
        children: <Widget>[
          const HomePageView(),
          const FavoriteView(),
          ShoppingCardView(),
          const ProfileView(),
        ],
      ),
    );
  }
}