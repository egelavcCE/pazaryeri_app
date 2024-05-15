import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/navigator/navigator_manager.dart';
import '../../../../product/navigator/navigator_route_items.dart';
import '../../../../product/utility/page_utility/basic/verification_code_utility.dart';
import '../../../../product/utility/page_utility/basic/welcome_utility.dart';
import '../../../../product/utility/project_utility/image_utility.dart';


class VerificationView extends StatelessWidget with WelcomeUtility, VerificationCodeUtility {
  VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatActionButton(context, text: "Onayla", onPressed: () {
        NavigatorController.instance.pushToPage(NavigateRoutesItems.createProfile);
      }),
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              width: context.sized.width,
              height: context.sized.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageUtility.getImagePath("welcome")),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Padding(
                padding: context.padding.horizontalMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    marketPlaceTitle(context),
                    context.sized.emptySizedHeightBoxHigh,
                    verificationCodeText(context),
                    buildVerificationCodeContainerLvb(context),
                    Obx(() => timeRemainingText(context)),
                    resendButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
class _VerificationViewState extends State<VerificationView> with WelcomeUtility,VerificationCodeUtility{
  int _counter = 180;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_counter > 0) {
          setState(() {
            _counter--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatActionButton(context,text: "Onayla", onPressed: () { context.route.navigateToPage(const CreateProfileView()); }),
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              width: context.sized.width,
              height: context.sized.height,
              decoration: BoxDecoration(
                  image: DecorationImage(image:
                  AssetImage(ImageUtility.getImagePath("welcome")),
                      fit: BoxFit.fitWidth
                  )
              ),
              child: Padding(
                padding: context.padding.horizontalMedium,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    marketPlaceTitle(context),
                    context.sized.emptySizedHeightBoxHigh,
                    verificationCodeText(context),
                    buildVerificationCodeContainerLvb(context),
                    timeRemainingText(context),
                    resendButton(context)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Center timeRemainingText(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.padding.onlyTopNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Doğrulama kodunuzun kalan süresi: ',
              style: context.general.textTheme.labelLarge,
            ),
            Text(
              "$_counter",
              style: context.general.textTheme.labelLarge?.copyWith(
                  color: ProjectColor.apricot.getColor()
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
