

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../screen/main_page/controller/main_page_controller.dart';
import '../../../../screen/profile/address/controller/address_controller.dart';
import '../../../../screen/profile/address/model/address_model.dart';
import '../../../../screen/profile/address/view/address_view.dart';
import '../../../color/project_color.dart';
import '../../../widget/custom_elevated_button.dart';

mixin AddressViewUtility{
  final AddAddressController controller = Get.put(AddAddressController());
  MainPageController mainPageController = Get.put(MainPageController());

  double buildAddressCardHeigth(BuildContext context) =>
      context.sized.dynamicHeight(0.24);

  Widget buildLvbForAddressCard(BuildContext context) {
    return Obx(() => Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      height: buildAddressCardHeigth(context) *
          (controller.addressItems?.length ?? 0),
      width: double.infinity,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.addressItems?.length ?? 0,
        itemBuilder: (context, index) {
          return _buildAddressCard(
            index: index,
            context: context,
            model: controller.addressItems?[index] ??
                AddressModel(
                  addressTitle: "null",
                  address: "null",
                  province: "null",
                  district: "null",
                ),
          );
        },
      ),
    ));
  }

  Padding buildAddNewAddress(BuildContext context,{
    String? text,
    IconData? icon,
    Future<dynamic> Function()? onPressed,
}) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: CustomElevatedButton(
        shadowColor: Colors.black,
        padding: context.padding.horizontalNormal,
        width: context.sized.width,
        height: context.sized.dynamicHeight(0.085),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: ProjectColor.apricot.getColor(), width: 1),
            borderRadius: context.border.normalBorderRadius),
        onPressed: onPressed ?? () {
          extractShowModalBottomSheet(context: context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: context.padding.onlyRightLow,
              child: Icon(
                icon ?? Icons.location_on_outlined,
                color: ProjectColor.apricot.getColor(),
              ),
            ),
            Text(
              text ?? 'Yeni Adress Ekle',
              style: context.general.textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> extractShowModalBottomSheet(
      {required BuildContext context, bool? isEdit, int? index}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return AddAddressForm(
          bottomSheetContext: context,
          isEdit: isEdit,
          index: index,
        );
      },
    );
  }

  Padding _buildAddressCard(
      {required BuildContext context, required AddressModel model,int? index}) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        height: context.sized.dynamicHeight(0.22),
        child: Card(
          color: ProjectColor.lightGrey.getColor(),
          key: Key(model.addressTitle),
          child: Padding(
            padding: EdgeInsets.all(context.sized.normalValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: ProjectColor.apricot.getColor(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: context.padding.onlyLeftLow,
                        child: Text(model.addressTitle,
                            style: context.general.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {
                        extractShowModalBottomSheet(context: context,isEdit: true,index: index);
                      },
                    ),
                  ],
                ),
                Text(
                  model.address,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Padding(
                  padding: context.padding.onlyTopLow,
                  child: Text("${model.province} / ${model.district}"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}