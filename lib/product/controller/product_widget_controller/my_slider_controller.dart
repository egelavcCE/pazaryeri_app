

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MySliderController extends GetxController{
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int pageCount = 3;

  PageController get getPageController => _pageController;
  int get getCurrentPage => _currentPage;

  @override
  void onInit() {
    super.onInit();
    _pageController.addListener(() {
      _currentPage = _pageController.page!.round();
      update();
    });
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }
}