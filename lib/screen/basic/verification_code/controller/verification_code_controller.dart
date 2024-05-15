import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class VerificationController extends GetxController {
  RxInt counter = 180.obs; // RxInt olarak tanımla ve .obs ile izle
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    counter.value = 180;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (counter.value > 0) {
          counter.value--;
        } else {
          timer.cancel();
        }
      },
    );
  }

  void disposeTimer() {
    _timer.cancel();
  }
}
