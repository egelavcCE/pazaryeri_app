import 'package:flutter/material.dart';

import '../../../../product/color/project_color.dart';
import '../../../../product/widget/general_app_bar.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(textColor: ProjectColor.apricot.getColor(),isLeadingActive: true,),
    );
  }
}
