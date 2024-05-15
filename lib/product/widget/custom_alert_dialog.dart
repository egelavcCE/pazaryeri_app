import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../screen/main_page/controller/main_page_controller.dart';
import '../color/project_color.dart';
import '../utility/project_utility/image_utility.dart';
import 'custom_bottom_nav_bar.dart';
import 'custom_elevated_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String image;
  final bool? isProductDetail;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.image, this.isProductDetail,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close_outlined,
                    color: Colors.grey,
                  )),
              Container(
                width: context.sized.dynamicWidth(0.5),
                height: context.sized.dynamicWidth(0.5),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(
                    ImageUtility.getImagePath(image)
                  ),fit: BoxFit.cover)
                ),
              ),
            ],
          ),
          Text(title,style: context.general.textTheme.titleMedium
              ?.copyWith(color: ProjectColor.apricot.getColor(),fontWeight: FontWeight.w600),
          ),
        ],
      ),
      content: Text(message,textAlign: TextAlign.center,),
      actions: [
        Column(
          children: [
            _buildAlertDialogActionsButton(
              onPressed: (){
                if(isProductDetail ?? false){
                  Get.back();
                }
                Get.back();
                final MainPageController mainPageController = Get.put(MainPageController());
                mainPageController.onPageChanged(BottomNavBarItems.shopping.index);
                mainPageController.onItemTapped(BottomNavBarItems.shopping.index, context);
              },
                context: context, title: "Sepete Git"),
            Padding(
              padding: context.padding.onlyTopNormal,
              child: _buildAlertDialogActionsButton(
                onPressed: (){
                  Get.back();
                },
                  context: context,
                  title: "Alışverişe Devam Et",
                  backgroundColor: ProjectColor.apricot.getColor(),
                  textColor: Colors.white),
            ),
          ],
        )
      ],
    );
  }

  CustomElevatedButton _buildAlertDialogActionsButton({
  required BuildContext context,
    Color? backgroundColor,
    Color? textColor,
    required String title,
    required void Function() onPressed,
}) {
    return CustomElevatedButton(
              shape: RoundedRectangleBorder(
                borderRadius: context.border.normalBorderRadius,
                side: BorderSide(color: ProjectColor.apricot.getColor()),
              ),
              backgroundColor: backgroundColor ?? Colors.white,
              height: context.sized.dynamicHeight(0.06),
              width: double.infinity,
              onPressed: onPressed,
              child: Text(
                title,
                style: context.general.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: textColor ?? ProjectColor.apricot.getColor()),
              ),
          );
  }
}