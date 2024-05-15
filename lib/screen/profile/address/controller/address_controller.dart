

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../model/address_model.dart';

class AddAddressController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxList<AddressModel>? addressItems = <AddressModel>[].obs;
  late BuildContext bottomSheetContext;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();

  void saveAddress(AddressModel model,BuildContext context) {
    if (formKey.currentState!.validate()) {
      addressItems?.add(model);
      update();
      context.route.pop();
    }
  }

  void editAddress({required AddressModel model,required BuildContext context,int? index}){
    if(formKey.currentState!.validate() && (addressItems?.isNotEmpty ?? false) && index != null){
      addressItems?[index] = model;
      update();
      context.route.pop();
    }
  }
}