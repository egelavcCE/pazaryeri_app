import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../screen/basic/verification_code/controller/verification_code_controller.dart';
import '../../../color/project_color.dart';

mixin VerificationCodeUtility{
  final VerificationController controller = Get.put(VerificationController());

  Container buildVerificationCodeContainerLvb(BuildContext context) {
    return Container(
      margin: context.padding.onlyTopMedium,
      height: context.sized.dynamicWidth(0.12),
      width: context.sized.width,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: index == 5 ? EdgeInsets.zero : context.padding.onlyRightLow,
            width: context.sized.dynamicWidth(0.12),
            decoration: BoxDecoration(
              color: ProjectColor.apricot.getColor(),
              borderRadius: context.border.normalBorderRadius,
              border: Border.all(width: 1,color: ProjectColor.apricot.getColor()),
            ),
            child: TextField(
              style: context.general.textTheme.titleLarge?.copyWith(color: Colors.white),
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 6,
      ),
    );
  }

  Center resendButton(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            controller.startCountdown();
          }, child: Text('Yeni kod gönder',style:
      context.general.textTheme.titleSmall?.copyWith(color: ProjectColor.apricot.getColor()),)
      ),
    );
  }

  Text verificationCodeText(BuildContext context) {
    return Text('Doğrulama Kodunu giriniz.',style:
    context.general.textTheme.titleMedium,);
  }

  Center timeRemainingText(BuildContext context,) {
    return Center(
      child: Padding(
        padding: context.padding.onlyTopNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Doğrulama kodunuzun kalan süresi: ',
              style: context.general.textTheme.labelLarge,
            ),
            Text(
              "${controller.counter.value}",
              style: context.general.textTheme.labelLarge?.copyWith(
                  color: ProjectColor.apricot.getColor()
              ),
            ),
          ],
        ),
      ),
    );
  }
}