import 'package:flutter/material.dart';

class AppUtils {
  static void showErrorSnackBar({required String msg, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showSuccessSnackBar({required String msg, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Center(
          child: CircularProgressIndicator(
        color: Colors.yellow,
      )),
    );
  }
}
