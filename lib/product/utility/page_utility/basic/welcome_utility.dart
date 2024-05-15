import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../color/project_color.dart';
import '../../../widget/custom_elevated_button.dart';
import '../../project_utility/image_utility.dart';

mixin WelcomeUtility{
  BoxDecoration buildDecorationParentContainerWithImage() {
    return BoxDecoration(
        image: DecorationImage(image:
        AssetImage(ImageUtility.getImagePath("welcome")),
            fit: BoxFit.fitWidth
        )
    );
  }

  Padding floatActionButton(BuildContext context,{required void Function() onPressed,required String text}) {
    return Padding(
      padding: context.padding.horizontalMedium,
      child: CustomElevatedButton(
          height: context.sized.dynamicHeight(0.07),
          width: context.sized.width,
          shape: RoundedRectangleBorder(
              borderRadius: context.border.highBorderRadius
          ),
          backgroundColor: ProjectColor.apricot.getColor(),
          onPressed: onPressed,
          child: Text(text,style:
          context.general.textTheme.titleMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.w700),),
      ));
  }
  Padding marketPlaceTitle(BuildContext context,{Color? textColor}) {
    return Padding(
      padding: context.padding.onlyTopMedium,
      child: Center(
        child: Text(
          'PAZARYERi',
          style: context.general.textTheme.displayMedium?.copyWith(color: textColor),
        ),
      ),
    );
  }
  Padding enterYourNumberText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopHigh,
      child: Text('TELEFON NUMARANIZI GİRİNİZ',
        style: context.general.textTheme.titleSmall?.copyWith(color: Colors.grey),),
    );
  }
  Padding welcomeAboardText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopHigh,
      child: Text('Hoşgeldin\nAramıza katıl ve doyasıya alışveriş yap!',
        style: context.general.textTheme.titleMedium,),
    );
  }
  Padding informationText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Text('Sana Doğrulama kodu içeren bir mesaj göndereceğiz. Sakın kimseyle paylaşma',
        style: context.general.textTheme.bodySmall?.copyWith(color: Colors.grey,fontWeight: FontWeight.w500),),
    );
  }
}