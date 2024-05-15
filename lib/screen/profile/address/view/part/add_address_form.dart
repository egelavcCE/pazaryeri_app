part of "../address_view.dart";

class AddAddressForm extends StatelessWidget {
  AddAddressForm({super.key, required this.bottomSheetContext,this.isEdit, this.index});

  final AddAddressController controller = Get.put(AddAddressController());
  final BuildContext bottomSheetContext;
  bool? isEdit;
  int? index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.sized.normalValue),
      padding: context.padding.horizontalNormal,
      height: context.sized.dynamicHeight(0.85),
      width: context.sized.width,
      decoration: BoxDecoration(
        boxShadow: [generalShadow()],
        color: ProjectColor.lightGrey.getColor(),
        borderRadius: context.border.normalBorderRadius,
      ),
      child: ListView(
        children: [
          _buildBottomSheetTitle(context),
          Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCustomFormTextField(
                    labelText: 'Title',
                    controller: controller.titleController),
                _buildCustomFormTextField(
                    labelText: 'Address',
                    controller: controller.addressController),
                _buildCustomFormTextField(
                    labelText: 'Province', controller: controller.provinceController),
                _buildCustomFormTextField(
                    labelText: 'District',
                    controller: controller.districtController),
                _buildSaveButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildBottomSheetTitle(BuildContext context) {
    return Padding(
          padding: context.padding.verticalNormal,
          child: Center(
            child: Text('Add New Address',style:
              context.general.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),),
          ),
        );
  }

  Padding _buildSaveButton(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: CustomElevatedButton(
          width: double.infinity,
          shape: RoundedRectangleBorder(
            borderRadius: context.border.normalBorderRadius,
          ),
          backgroundColor: ProjectColor.apricot.getColor(),
        onPressed: () {
          var addressModel = AddressModel(
            address: controller.addressController.text,
            addressTitle: controller.addressController.text,
            district: controller.districtController.text,
            province: controller.provinceController.text,
          );
          (isEdit ?? false)
              ? controller.editAddress(model: addressModel, context: context, index: index)
              : controller.saveAddress(addressModel, context);
        },
        child: Text('Kaydet', style: context.general.textTheme.bodyLarge?.copyWith(color: Colors.white),),
      ),
    );
  }

  TextFormField _buildCustomFormTextField(
      {required String labelText, required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Lütfen bir ${labelText.toLowerCase()} girin';
        }
        return null;
      },
    );
  }
}
