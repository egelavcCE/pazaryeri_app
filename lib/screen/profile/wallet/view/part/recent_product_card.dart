part of '../wallet_view.dart';

class RecentProduct extends StatelessWidget {
  const RecentProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.onlyTopNormal,
      height: context.sized.dynamicHeight(0.18),
      decoration: _buildRecentMainContainerDecoration(context),
      child: Padding(
        padding: context.padding.horizontalMedium,
        child: Row(
          children: [
            _buildProductImage(context),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDateText(context),
                  _buildProductTitleText(context),
                  _buildBrandText(),
                  _buildProductPriceText(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildRecentMainContainerDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: context.border.normalBorderRadius,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        transform: const GradientRotation(0.5),
        colors: [
          ProjectColor.apricot.getColor(),
          ProjectColor.lightGrey.getColor(),
          ProjectColor.lightGrey.getColor(),
          ProjectColor.apricot.getColor(),
        ],
        stops: const [0.0, 0.2, 0.8, 1.0],
        tileMode: TileMode.repeated,
      ),
    );
  }

  Align _buildProductPriceText(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Text(
          '-368,00 TL',
          style: context.general.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: ProjectColor.apricot.getColor()),
        ));
  }

  Text _buildBrandText() => const Text('Nivea');

  Row _buildProductTitleText(BuildContext context) {
    return Row(
      children: [
        Text(
          'El Kremi - ',
          style: context.general.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const Text(
          "Dynamic 100 ml",
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Align _buildDateText(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        '10-05-2024 08.37',
        style:
            context.general.textTheme.bodySmall?.copyWith(color: Colors.grey),
      ),
    );
  }

  Container _buildProductImage(BuildContext context) {
    return Container(
      margin: context.padding.onlyRightNormal,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(ImageUtility.getImagePath("product"))),
        borderRadius: context.border.normalBorderRadius,
      ),
      width: context.sized.dynamicWidth(0.2),
      height: context.sized.dynamicWidth(0.2),
    );
  }
}
