
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import '../../../../screen/basic/create_profile/controller/create_profile_controller.dart';
import '../../../../screen/basic/create_profile/view/create_profile_view.dart';
import '../../../color/project_color.dart';

mixin CreateProfileUtility on State<CreateProfileView>{
  final CreateProfileController controller = Get.put(CreateProfileController());

  Column dateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.padding.onlyTopNormal,
          child: Text('Dogum Tarihiniz',style: context.general
              .textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),),
        ),
        Padding(
          padding: context.padding.onlyTopLow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => _buildDropDown(widget: buildDayDropdown())),
              Obx(() => _buildDropDown(widget: buildMonthDropdown())),
              Obx(() => _buildDropDown(widget: buildYearDropdown())),
            ],
          ),
        ),
      ],
    );
  }

  DropdownButton<int> buildDayDropdown() {
    return DropdownButton<int>(
      iconEnabledColor: ProjectColor.apricot.getColor(),
      value: controller.selectedDay.value,
      onChanged: (value) {
        controller.updateSelectedDay(value!);
      },
      underline: const SizedBox.shrink(),
      items: List.generate(
        31,
            (index) => DropdownMenuItem<int>(
          value: index + 1,
          child: Text('${index + 1}'),
        ),
      ),
    );
  }

  DropdownButton<int> buildMonthDropdown() {
    return DropdownButton<int>(
      iconEnabledColor: ProjectColor.apricot.getColor(),
      value: controller.selectedMonth.value,
      underline: const SizedBox.shrink(),
      onChanged: (value) {
        controller.updateSelectedMonth(value!);
      },
      items: List.generate(
        12,
            (index) => DropdownMenuItem<int>(
          value: index + 1,
          child: Text('${index + 1}'),
        ),
      ),
    );
  }

  DropdownButton<int> buildYearDropdown() {
    return DropdownButton<int>(
      iconEnabledColor: ProjectColor.apricot.getColor(),
      underline: const SizedBox.shrink(),
      value: controller.selectedYear.value,
      onChanged: (value) {
        controller.updateSelectedYear(value!);
      },
      items: List.generate(
        100,
            (index) => DropdownMenuItem<int>(
          value: DateTime.now().year - index,
          child: Text('${DateTime.now().year - index}'),
        ),
      ),
    );
  }

  Container customTextFormField(
      BuildContext context, {
        required String labelText,
        required String? Function(String?) validator,
        required void Function(String?)? onSaved,
        required TextEditingController controller,
      }) {
    return Container(
      margin: context.padding.onlyTopNormal,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: context.border.normalBorderRadius, // Border radius
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: context.padding.onlyLeftNormal,
          labelText: labelText,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 2),
            borderRadius: context.border.normalBorderRadius, // Border radius
          ),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }

  Padding createProfileText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopMedium,
      child: Text(
        'Profilini Oluştur.',
        style: context.general.textTheme.titleMedium,
      ),
    );
  }

  Container _buildDropDown({required Widget widget}) {
    return Container(
        width: context.sized.dynamicWidth(0.24),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: context.border.normalBorderRadius,
        ),
        child: Center(child: widget)
    );
  }
}