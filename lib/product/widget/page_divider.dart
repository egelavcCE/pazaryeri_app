import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomPageDivider extends StatelessWidget {
  CustomPageDivider({super.key, this.padding});

  EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? context.padding.onlyTopNormal,
      child: const Divider(
        height: 2,
        color: Colors.black12,
      ),
    );
  }
}
