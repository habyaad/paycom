import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

class ToastService {
  ToastService._();

  static void success(String msg, context) {
    CherryToast.success(
      description: Text(msg),
      title: const Text("Success"),
    ).show(context);
  }

  static void error(String msg, context) {
    CherryToast.success(
      description: Text(msg),
      title: const Text("Error"),
    ).show(context);
  }

}