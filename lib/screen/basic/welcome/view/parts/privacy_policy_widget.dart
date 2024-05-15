part of '../welcome_view.dart';

class PrivacyPolicyWidget extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyPolicyController>(
      init: PrivacyPolicyController(),
      builder: (controller) {
        return CheckboxListTile(
          checkboxShape: RoundedRectangleBorder(
            borderRadius: context.border.normalBorderRadius,
          ),
          contentPadding: EdgeInsets.zero,
          title: GestureDetector(
            onTap: () {},
            child: Text(
              "Gizlilik Politikası ve şartlarinizi kabul ediyorum.",
              style: context.general.textTheme.bodySmall?.copyWith(
                color: ProjectColor.apricot.getColor(),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          value: controller.isChecked.value,
          activeColor: ProjectColor.apricot.getColor(),
          onChanged: controller.toggleCheckbox,
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}

/*class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  _PrivacyPolicyWidgetState createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkboxShape: RoundedRectangleBorder(
          borderRadius: context.border.normalBorderRadius
      ),
      contentPadding: EdgeInsets.zero,
      title: GestureDetector(
        onTap: () {},
        child: Text(
          "Gizlilik Politikası ve şartlarinizi kabul ediyorum.",
          style: context.general.textTheme.bodySmall?.copyWith(
              color: ProjectColor.apricot.getColor(),
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      value: _isChecked,
      activeColor: ProjectColor.apricot.getColor(),
      onChanged: (value) {
        setState(() {
          _isChecked = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
 */