
part of"../card_view.dart";


class CardBottomSheet extends StatelessWidget with CreditCardUtility{
  CardBottomSheet({super.key, required this.bottomSheetContext,this.isEdit, this.index});

  final BuildContext bottomSheetContext;
  bool? isEdit;
  int? index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(bottomSheetContext.sized.normalValue),
      padding: bottomSheetContext.padding.horizontalNormal,
      height: bottomSheetContext.sized.dynamicHeight(0.85),
      width: bottomSheetContext.sized.width,
      decoration: BoxDecoration(
        boxShadow: [generalShadow()],
        color: ProjectColor.lightGrey.getColor(),
        borderRadius: bottomSheetContext.border.normalBorderRadius,
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildBottomSheetTitle(context),
          Form(
            key: creditCardController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCustomFormTextField(
                    labelText: 'Card Name',
                    controller: creditCardController.cardNameController),
                _buildCustomFormTextField(
                    labelText: 'Logo Url(visa/master)',
                    controller: creditCardController.logoUrlController),
                _buildCustomFormTextField(
                    labelText: 'Card Owner Name', controller: creditCardController.cardOwnerNameController),
                _buildCustomFormTextField(
                    labelText: 'Card Owner Last Name',
                    controller: creditCardController.cardOwnerLastNameController),
                _buildCustomFormTextField(
                    labelText: 'Card Number',
                    controller: creditCardController.cardNumberController),
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
          var addressModel = CreditCardModel(
            cardName: creditCardController.cardNameController.text,
            cardOwnerName: creditCardController.cardOwnerNameController.text,
            cardNumber: creditCardController.cardNumberController.text,
            cardOwnerLastName: creditCardController.cardOwnerLastNameController.text,
            logoUrl: creditCardController.logoUrlController.text,
          );
          (isEdit ?? false)
              ? creditCardController.editCard(model: addressModel, context: context, index: index)
              : creditCardController.saveCard(addressModel, context);
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
