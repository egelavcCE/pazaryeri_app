
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 - Not Found'),
      ),
      body: Center(
        child: Text(
          'Üzgünüz, bu sayfa incunabulum!',
          style: context.general.textTheme.labelLarge,
        ),
      ),
    );
  }
}