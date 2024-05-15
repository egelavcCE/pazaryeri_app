import 'package:Pazaryeri/product/extension/context/border_Radius.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/color/project_color.dart';
import '../../../../product/utility/page_utility/product/product_detail_utility.dart';
import '../../../../product/widget/custom_elevated_button.dart';
import '../../../../product/widget/general_app_bar.dart';
import '../../../../product/widget/general_shadow.dart';
import '../controller/all_comment_controller.dart';

class AllCommentView extends StatelessWidget with ProductDetailUtility{
  AllCommentView({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ProjectColor.lightGrey.getColor(),
      appBar: GeneralAppBar(textColor: ProjectColor.apricot.getColor(),isLeadingActive: true,),
        body: SafeArea(
          child: GetBuilder(
            init: AllCommentController(),
            builder: (controller) {
              return ListView(
                children: [
                  Padding(
                    padding: context.padding.horizontalMedium,
                    child: Column(
                      children: [
                        buildSellerAndProductInfo(context),
                        SizedBox(
                          width: context.sized.width,
                          height: controller.commentItems.length * context.sized.dynamicHeight(0.174),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.commentItems.length,
                            itemBuilder: (context, index) {
                              return buildCommentWithDivider(context, index,
                                  commentItems: controller.commentItems);
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
        height: context.sized.dynamicHeight(0.08),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [generalShadow()],
          borderRadius: context.myBorder.dynamicBorderRadiusOnly(topRight: 0.04,topLeft: 0.04)
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBottomNavBarButton(context: context,text: "Yorum Yap",),
              buildBottomNavBarButton(context: context,text: "Yorum Yap",backgroundColor: ProjectColor.apricot.getColor(),textColor: Colors.white),
            ],
          ),
      )
    );
  }

  CustomElevatedButton buildBottomNavBarButton({
  required BuildContext context,
    required String text,
    Color? textColor,
    Color? backgroundColor
}) {
    return CustomElevatedButton(
              width: context.sized.dynamicWidth(0.36),
                onPressed: (){},
              shape: RoundedRectangleBorder(borderRadius: context.border.lowBorderRadius,side: BorderSide(width: 1,color: ProjectColor.apricot.getColor())),
              backgroundColor: backgroundColor ?? Colors.white,
                child: Text(text,
                style: context.general.textTheme.titleSmall?.copyWith(color: textColor ?? ProjectColor.apricot.getColor(),),),
            );
  }
}
