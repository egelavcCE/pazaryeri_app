import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../color/project_color.dart';

class CustomDropDownButton<T> extends StatefulWidget {
  final List<T> items;
  final String text;

  const CustomDropDownButton({
    super.key,
    required this.items, required this.text,
  });

  @override
  State<CustomDropDownButton<T>> createState() => _CustomDropDownButtonState<T>();
}

class _CustomDropDownButtonState<T> extends State<CustomDropDownButton<T>> {
  T? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        width: context.sized.width,
        child: Container(
          width: context.sized.dynamicWidth(0.24),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: context.border.normalBorderRadius,
          ),
          child: DropdownButton<T>(
            iconEnabledColor: ProjectColor.apricot.getColor(),
            isExpanded: true,
            icon: null,
            value: selectedValue,
            hint: Padding(
              padding: context.padding.onlyLeftNormal,
              child: Text(widget.text),
            ),
            underline: const SizedBox.shrink(),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            items: widget.items.map((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Padding(
                  padding: context.padding.onlyLeftNormal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(value.toString()),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
