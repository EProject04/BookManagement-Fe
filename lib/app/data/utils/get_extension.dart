import 'package:flutter/cupertino.dart';
import 'package:frame/app/data/utils/dialog_common_style.dart';
import 'package:frame/app/data/utils/dialog_loading.dart';
import 'package:get/get.dart';

extension GetExtension on GetInterface {
  dismiss() {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
  }

  showLoading({String text = ''}) {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(
        LoadingDialog(text: text.isEmpty ? "Loading..." : text),
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: false);
  }

  showDialog({
    String title = '',
    String content = '',
    String backText = '',
    String nextText = '',
    bool backVisible = true,
    bool nextVisible = true,
    VoidCallback? backTap,
    VoidCallback? nextTap,
    backKey = false,
  }) {
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.back();
    }
    Get.dialog(
        CommonDialog(
          title : title,
          content : content,
          backText : backText.isEmpty ? "Quit" : backText,
          nextText : nextText.isEmpty ? "Enter" : nextText,
          backVisible : backVisible,
          nextVisible : nextVisible,
          backTap : backTap,
          nextTap : nextTap,
        ),
        transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: backKey);
  }
}