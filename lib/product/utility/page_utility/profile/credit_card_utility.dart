import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../screen/profile/card/controller/credit_card_controller.dart';
import '../../../../screen/profile/card/model/credit_card_model.dart';
import '../../../../screen/profile/card/view/card_view.dart';
import '../../../color/project_color.dart';
import '../../../widget/general_shadow.dart';
import '../../project_utility/image_utility.dart';

mixin CreditCardUtility{
  CreditCardController creditCardController = Get.put(CreditCardController());

  double buildCreditCardHeigth(BuildContext context) =>
      context.sized.dynamicHeight(0.24);

  Widget buildLvbForAddressCard(BuildContext context) {
    return Obx(() => Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      height: buildCreditCardHeigth(context) *
          (creditCardController.creditCardItems?.length ?? 0),
      width: double.infinity,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: creditCardController.creditCardItems?.length ?? 0,
        itemBuilder: (context, index) {
          return buildCreditCardWidget(
            index: index,
            context: context,
            model: creditCardController.creditCardItems?[index] ??
                CreditCardModel(
                  cardName: "null",
                  cardNumber: "null",
                  cardOwnerLastName: "null",
                  cardOwnerName: "null",
                  logoUrl: ImageUtility.getImagePath("visa"),
                ),
          );
        },
      ),
    ));
  }

  Padding buildCreditCardWidget(
      {required BuildContext context, required CreditCardModel model,int? index}) {
    var dynamicWidthLogo = context.sized.dynamicWidth(0.12);
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        height: context.sized.dynamicHeight(0.22),
        child: Card(
          color: ProjectColor.lightGrey.getColor(),
          key: Key(model.cardName),
          child: Padding(
            padding: EdgeInsets.all(context.sized.normalValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: dynamicWidthLogo * 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(ImageUtility.getImagePath(model.logoUrl)),fit: BoxFit.cover)
                        ),
                        height: dynamicWidthLogo,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () {
                          buildShowModalBottomSheetForCardView(
                            context: context,
                            index: index,
                            isEdit: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: context.padding.onlyBottomLow,
                  child: Text(
                    "${model.cardOwnerName} / ${model.cardOwnerLastName}" ,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: context.padding.onlyBottomNormal,
                  child: Text(model.cardNumber),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheetForCardView(
      {required BuildContext context, bool? isEdit, int? index}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        return CardBottomSheet(
          bottomSheetContext: bottomSheetContext,
          index: index,
          isEdit: isEdit,
        );
      },
    );
  }
}