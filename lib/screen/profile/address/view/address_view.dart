import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/color/project_color.dart';
import '../../../../product/navigator/navigator_manager.dart';
import '../../../../product/utility/page_utility/profile/address_view_utility.dart';
import '../../../../product/widget/custom_bottom_nav_bar.dart';
import '../../../../product/widget/custom_elevated_button.dart';
import '../../../../product/widget/general_app_bar.dart';
import '../../../../product/widget/general_shadow.dart';
import '../controller/address_controller.dart';
import '../model/address_model.dart';

part 'part/add_address_form.dart';

class AddressesView extends StatelessWidget with AddressViewUtility{
  AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
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
                buildAddNewAddress(context),
                buildLvbForAddressCard(context),
              ],
            ),
          ),
        ),
      bottomNavigationBar: CustomBottomNavBar(controller: mainPageController,
        onTap: (int index){
        NavigatorController.instance.pop(); //knk burda tekli sayfa geçişi oldugundan ötürü tek pop attım
          mainPageController.onItemTapped(index, context);
        },
      ),
    );
  }
}