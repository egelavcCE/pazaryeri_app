import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/color/project_color.dart';
import '../../../../product/utility/page_utility/profile/wallet_utility.dart';
import '../../../../product/utility/project_utility/image_utility.dart';
import '../../../../product/widget/general_app_bar.dart';

part 'part/recent_product_card.dart';

class WalletView extends StatelessWidget with WalletUtility{
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(textColor: ProjectColor.apricot.getColor(),isLeadingActive: true,),
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalMedium,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildWalletContainer(context),
              buildMovementsText(context),
              buildRecentTransactionsText(context),
              const RecentProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
