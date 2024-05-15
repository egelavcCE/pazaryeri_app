import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../controller/product_widget_controller/my_slider_controller.dart';
import '../utility/project_utility/image_utility.dart';

class MySlider extends StatelessWidget {
  MySlider({super.key});
  final MySliderController mySliderController = MySliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<MySliderController>(
          init: mySliderController,
          builder: (controller) {
            return PageView.builder(
              controller: controller.getPageController,
              scrollDirection: Axis.horizontal,
              itemCount: controller.pageCount,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: context.border.normalBorderRadius,
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: context.border.normalBorderRadius,
                      child: Image.asset(
                        ImageUtility.getImagePath("resim1"),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        _sliderTinyCircle(context),
      ],
    );
  }

  Positioned _sliderTinyCircle(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: GetBuilder<MySliderController>(
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.pageCount,
                  (index) => Padding(
                padding: EdgeInsets.all(context.sized.lowValue),
                child: Container(
                  width: index == controller.getCurrentPage ? 10 : 5,
                  height: context.sized.lowValue,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == controller.getCurrentPage ? Colors.white24 : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
