import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin class ControllerMixin {
  void showSnackBar_() {
    Get.snackbar(
      " ",
      "Sao chép thành công!",
      // borderColor: AppColors.primary,

      backgroundColor: Colors.black.withOpacity(0.8),
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      borderRadius: 10,
    );
  }

  void showErrorAlert(String message, VoidCallback onClose) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: '',
      radius: 15,
      content: SizedBox(
        width: Get.width - 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(100, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Get.back();

                  onClose();
                },
                child: const Text(
                  'Đóng',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}
