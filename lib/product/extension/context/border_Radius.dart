
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
extension BorderRadiusContextExtension on BuildContext{
  _BorderRadiusContextExtension get myBorder => _BorderRadiusContextExtension(context: this);
}

class _BorderRadiusContextExtension{
  final BuildContext _context;
  double get _height => _context.sized.width;

  _BorderRadiusContextExtension({required BuildContext context}) : _context = context;

  BorderRadius dynamicBorderRadiusCircular({double? borderSize}) {
    return BorderRadius.circular(_height * (borderSize ?? 0.0));
  }

  BorderRadius dynamicBorderRadiusOnly(
      {double? topLeft, double? topRight, double? bottomLeft, double? bottomRight}) =>
      BorderRadius.only(
          topLeft: Radius.circular(_height * (topLeft ?? 0.0)),
          topRight: Radius.circular(_height * (topRight ?? 0.0)),
        bottomLeft: Radius.circular(_height * (bottomLeft ?? 0.0)),
        bottomRight: Radius.circular(_height * (bottomRight ?? 0.0)),
      );
}