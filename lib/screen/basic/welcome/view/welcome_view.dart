import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/color/project_color.dart';
import '../../../../product/navigator/navigator_manager.dart';
import '../../../../product/navigator/navigator_route_items.dart';
import '../../../../product/utility/page_utility/basic/welcome_utility.dart';
import '../../../../product/utility/project_utility/image_utility.dart';
import '../controller/privacy_policy_controller.dart';

part 'parts/phone_number_widget.dart';
part 'parts/privacy_policy_widget.dart';

class WelcomeView extends StatelessWidget with WelcomeUtility{
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatActionButton(context,text: 'Kodu Gönder',onPressed: () {
        NavigatorController.instance.pushAndRemoveUntil(NavigateRoutesItems.verificationCode);
      },),
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              width: context.sized.width,
              height: context.sized.height,
              decoration: buildDecorationParentContainerWithImage(),
              child: Padding(
                padding: context.padding.horizontalMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    marketPlaceTitle(context),
                    welcomeAboardText(context),
                    enterYourNumberText(context),
                    const PhoneNumberWidget(),
                    informationText(context),
                    const PrivacyPolicyWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
