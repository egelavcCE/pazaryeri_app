import 'package:flutter/material.dart';

BoxShadow generalShadow() {
  return BoxShadow(
    color: Colors.black.withOpacity(0.6),
    blurRadius: 6,
    offset: const Offset(0, 3),
  );
}