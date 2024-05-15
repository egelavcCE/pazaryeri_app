part of "../order_detail_view.dart";

class ProductDetailInOrderDetail extends StatelessWidget
    with OrderDetailUtility {
  ProductDetailInOrderDetail({super.key, this.model});
  final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.sized.normalValue),
      margin: context.padding.onlyTopNormal,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: context.border.normalBorderRadius,
        border: Border.all(color: Colors.black26, width: 1),
      ),
      width: double.infinity,
      height: context.sized.dynamicHeight(0.88),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOrderDateText(context),
          _buildOrderNoText(context),
          CustomPageDivider(),
          _buildSellerInfo(context),
          _buildProductInfoMenuButtonPlace(context),
          CustomPageDivider(),
          _buildSubmittedText(context),
          _buildWhichDayOrderSubmittedText(context),
          _buildProductCargoInfo(context),
          _buildProductGeneralInfo(context),
          CustomPageDivider(),
          buildIconAndText(context,
              text: "Trendyol Asistan", icon: Icons.comment_outlined),
          buildIconAndText(context,
              text: "Fatura Görüntüle", icon: Icons.border_color_outlined),
          buildIconAndText(context,
              text: "Dolap'ta Hızlı Sat", icon: Icons.add),
        ],
      ),
    );
  }

  Container _buildProductGeneralInfo(BuildContext context) {
    var dynamicWidth = context.sized.dynamicWidth(0.28);
    return Container(
      margin: context.padding.onlyTopNormal,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: dynamicWidth,
            height: dynamicWidth * 4 / 3,
            decoration: BoxDecoration(
                borderRadius: context.border.lowBorderRadius,
                color: Colors.green,
                image: DecorationImage(
                    image: AssetImage(
                      ImageUtility.getImagePath("${model?.productUrl}"),
                    ),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: context.padding.onlyLeftLow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model?.productBrand ?? "",
                  style: _buildBodyMedium(context),
                ),
                Text(
                  model?.productName ?? "",
                  style: _buildBodyMedium(context),
                ),
                Text(
                  'Beden: Krem, Tek Ebat Adet: 1',
                  style: _buildBodyMedium(context),
                ),
                Text(
                  model?.productPrice.toString() ?? "",
                  style: _buildBodyMedium(context,
                      color: ProjectColor.apricot.getColor()),
                ),
                _buildProductInfoMenuButton(
                    context: context,
                    onPressed: () {},
                    width: context.sized.dynamicWidth(0.5),
                    child: Text(
                      'Ürünü Değerlendir',
                      style: context.general.textTheme.bodyMedium
                          ?.copyWith(color: Colors.white),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildProductCargoInfo(BuildContext context) {
    return Container(
      height: context.sized.dynamicHeight(0.05),
      padding: context.padding.horizontalLow,
      margin: context.padding.onlyTopLow,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.black26),
        borderRadius: context.border.lowBorderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Kargo Firması: ',
                  style: _buildLabelLarge(context, color: Colors.black45),
                ),
                TextSpan(
                  text: 'Aras Kargo',
                  style: _buildLabelLarge(context, color: Colors.black),
                ),
              ],
            ),
          ),
          Text(
            'Teslimat Detay',
            style: _buildLabelLarge(context,
                color: ProjectColor.apricot.getColor(),
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  Padding _buildWhichDayOrderSubmittedText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Row(
        children: [
          Padding(
            padding: context.padding.onlyRightLow,
            child: const Icon(Icons.info_outline, color: Colors.green),
          ),
          Flexible(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Aşağıdaki 1 ürün ',
                    style: _buildLabelLarge(context, color: Colors.black45),
                  ),
                  TextSpan(
                    text: '13 Eylül Çarşamba ',
                    style: _buildLabelLarge(context, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'günü teslim edilmiştir.',
                    style: _buildLabelLarge(context, color: Colors.black45),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildSubmittedText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: Row(
        children: [
          Padding(
            padding: context.padding.onlyRightLow,
            child: const Icon(
              Icons.task_alt_outlined,
              color: Colors.green,
            ),
          ),
          Text(
            'Teslim Edildi',
            style: context.general.textTheme.labelLarge
                ?.copyWith(color: Colors.green, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Padding _buildProductInfoMenuButtonPlace(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildProductInfoMenuButton(
            context: context,
            text: "Satıcıyı Değerlendir",
            onPressed: () {},
          ),
          _buildProductInfoMenuButton(
              onPressed: () {},
              context: context,
              text: "Satıcıyı Takip Et",
              backgroundColor: Colors.white,
              width: context.sized.dynamicWidth(0.35),
              textColor: ProjectColor.apricot.getColor(),
              child: Text(
                'Satıcıyı Değerlendir',
                style: context.general.textTheme.labelLarge?.copyWith(
                    color: ProjectColor.apricot.getColor(),
                    fontWeight: FontWeight.w700),
              )),
        ],
      ),
    );
  }

  Padding _buildSellerInfo(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Row(
        children: [
          Text(
            'Satıcı: ${model?.seller}',
            style: buildBodyLarge(context),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: context.sized.normalValue,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Text _buildOrderNoText(BuildContext context) {
    return Text(
      'Teslimat No: 28462748',
      style: buildBodyLarge(context),
    );
  }

  Text _buildOrderDateText(BuildContext context) {
    return Text(
      'Teslimat Tarihi: 14.05.2024',
      style: buildBodyLarge(context),
    );
  }


  TextStyle? _buildBodyMedium(BuildContext context, {Color? color}) {
    return context.general.textTheme.bodyMedium
        ?.copyWith(fontWeight: FontWeight.bold, color: color);
  }

  TextStyle? _buildLabelLarge(BuildContext context,
          {Color? color, FontWeight? fontWeight}) =>
      context.general.textTheme.labelLarge
          ?.copyWith(color: color, fontWeight: fontWeight);

  CustomElevatedButton _buildProductInfoMenuButton({
    required BuildContext context,
    Widget? child,
    required void Function() onPressed,
    Color? backgroundColor,
    Color? textColor,
    double? width,
    String? text,
  }) {
    return CustomElevatedButton(
      shape: RoundedRectangleBorder(
          borderRadius: context.border.lowBorderRadius,
          side: BorderSide(color: ProjectColor.apricot.getColor())),
      height: context.sized.dynamicHeight(0.06),
      backgroundColor: backgroundColor ?? ProjectColor.apricot.getColor(),
      width: width ?? context.sized.dynamicWidth(0.45),
      padding: context.padding.horizontalNormal,
      onPressed: onPressed,
      child: child ??
          Row(
            children: [
              Padding(
                padding: context.padding.onlyRightLow,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: context.sized.dynamicHeight(0.022),
                    child: Icon(
                      Icons.storefront_outlined,
                      color: ProjectColor.apricot.getColor(),
                    )),
              ),
              Text(text ?? "",
                  style: context.general.textTheme.labelLarge?.copyWith(
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.w700)),
            ],
          ),
    );
  }
}
