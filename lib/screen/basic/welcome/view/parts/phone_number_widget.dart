part of"../welcome_view.dart";

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({super.key});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: context.sized.dynamicWidth(0.12),
            width: context.sized.width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: context.border.normalBorderRadius,
            ),
          ),
          Container(
            height: context.sized.dynamicWidth(0.12),
            width: context.sized.dynamicWidth(0.72),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: context.border.normalBorderRadius
            ),
            child: Row(
              children: [
                TextButton(onPressed: (){}, child:
                Text('+90',style: context.general.textTheme.titleSmall?.copyWith(color: Colors.grey),)),
                SizedBox(
                  width: context.sized.dynamicWidth(0.52),
                  child: Padding(
                    padding: context.padding.onlyBottomNormal,
                    child: const TextField(
                      cursorColor: Colors.black,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: context.sized.dynamicWidth(0.16),
              height: context.sized.dynamicWidth(0.12),
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(ImageUtility.getImagePath("turkish_flag")))
              ),
            ),
          ),
        ],
      ),
    );
  }
}