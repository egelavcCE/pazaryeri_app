import 'package:get/get.dart';

import '../../product_detail/model/comment_model.dart';

class AllCommentController extends GetxController {
  RxList<CommentModel> commentItems = <CommentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments != null && arguments is List<CommentModel>) {
      commentItems.value = arguments;
    }
  }
}