

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../color/project_color.dart';
import '../../project_utility/image_utility.dart';

mixin WalletUtility{

  Stack buildWalletContainer(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: context.padding.onlyRightMedium,
          margin: context.padding.onlyTopMedium,
          height: context.sized.dynamicHeight(0.225),
          width: context.sized.width,
          decoration: BoxDecoration(
            color: ProjectColor.lightGrey.getColor(),
            borderRadius: context.border.normalBorderRadius,
            border: Border.all(width: 1,color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: context.padding.onlyRightMedium,
                child: Text('Cüzdanım:',style: context.general.textTheme.titleLarge,),
              ),
              Text('368,00 TL',style: context.general.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700,color: ProjectColor.apricot.getColor()),),
            ],
          ),
        ),
        Positioned(
          left: -context.sized.dynamicWidth(0.06),
          bottom: -context.sized.dynamicWidth(0.06),
          child: SizedBox(
            width: context.sized.width,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Transform.rotate(
                angle: -12 * (3.14 / 180),
                child: Image.asset(
                  ImageUtility.getImagePath("wallet"),
                  height: context.sized.dynamicHeight(0.225),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding buildRecentTransactionsText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopMedium,
      child: Text('Recent Transactions',
        style: context.general.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),),
    );
  }

  Padding buildMovementsText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: Text('Haraketlerim',style:
      context.general.textTheme.titleLarge,),
    );
  }
}