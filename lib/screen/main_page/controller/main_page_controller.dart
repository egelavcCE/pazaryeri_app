

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';


class MainPageController extends GetxController{
  final PageController _pageController = PageController();
  PageController get getPageController => _pageController;


  var selectedIndex = 0.obs;
  void onPageChanged(int index){
    selectedIndex.value = index;
  }

  void onItemTapped(int index,BuildContext context){
    _pageController.animateToPage(
      index,
      duration: context.duration.durationLow,
      curve: Curves.ease,
    );
  }
}