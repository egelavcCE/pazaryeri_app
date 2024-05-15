import 'package:Pazaryeri/product/extension/context/border_Radius.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../color/project_color.dart';
import '../navigator/navigator_manager.dart';
import '../navigator/navigator_route_items.dart';
import '../utility/page_utility/basic/welcome_utility.dart';
import '../utility/project_utility/image_utility.dart';
import 'custom_elevated_button.dart';

class GeneralAppBar extends StatelessWidget
    with WelcomeUtility
    implements PreferredSizeWidget {
  const GeneralAppBar(
      {super.key, this.isLeadingActive = false, required this.textColor});

  final bool? isLeadingActive;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: context.myBorder.dynamicBorderRadiusOnly(
        bottomLeft: 0.05,
        bottomRight: 0.05,
      )),
      title: Align(
          alignment: Alignment.center,
          child: marketPlaceTitle(context, textColor: textColor)),
      leadingWidth: context.sized.dynamicWidth(0.16),
      leading: (isLeadingActive ?? false)
          ? Padding(
              padding: context.padding.onlyTopMedium,
              child: _buildAppBarButton(context, onPressed: () {
                context.route.pop();
              },
                  child: Icon(
                    Icons.arrow_back_outlined,
                    size: context.sized.mediumValue,
                    color: ProjectColor.apricot.getColor(),
                  )))
          : const SizedBox.shrink(),
      actions: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: context.padding.onlyTopMedium,
            child: _buildAppBarButton(context,
                onPressed: () {
                  NavigatorController.instance.pushToPage(NavigateRoutesItems.notification);
                },
                child: Image.asset(
                  ImageUtility.getImagePath("notification_appbar"),
                  color: ProjectColor.apricot.getColor(),
                  height: context.sized.mediumValue,
                  width: context.sized.mediumValue,
                ),
            ),
          ),
        ),
      ],
    );
  }

  CustomElevatedButton _buildAppBarButton(
    BuildContext context, {
    required void Function() onPressed,
    required Widget child,
  }) {
    return CustomElevatedButton(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: context.border.normalBorderRadius),
      onPressed: onPressed,
      width: context.sized.dynamicWidth(0.16),
      height: context.sized.dynamicHeight(0.12),
      child: child,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
