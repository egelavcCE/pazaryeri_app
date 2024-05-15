
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../model/credit_card_model.dart';

class CreditCardController extends GetxController{
  final formKey = GlobalKey<FormState>();
  RxList<CreditCardModel>? creditCardItems = <CreditCardModel>[].obs;
  late BuildContext bottomSheetContext;

  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController logoUrlController = TextEditingController();
  final TextEditingController cardOwnerNameController = TextEditingController();
  final TextEditingController cardOwnerLastNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();

  void saveCard(CreditCardModel model,BuildContext context) {
    if (formKey.currentState!.validate()) {
      creditCardItems?.add(model);
      update();
      context.route.pop();
    }
  }

  void editCard({required CreditCardModel model,required BuildContext context,int? index}){
    if(formKey.currentState!.validate() && (creditCardItems?.isNotEmpty ?? false) && index != null){
      creditCardItems?[index] = model;
      update();
      context.route.pop();
    }
  }
}