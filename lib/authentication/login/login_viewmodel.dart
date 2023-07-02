import 'dart:convert';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../model/api_response_model.dart';
import '../../services/api_endpoints.dart';
import '../../services/api_services.dart';
import '../../services/toast_service.dart';

class LoginViewModel extends BaseViewModel {
  final ApiServices _apiServices = ApiServices();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn(BuildContext context) async {
    Map<String, dynamic> data = {
      "email": emailController.text,
      "password": passwordController.text
    };
    ApiResponse response = await _apiServices.post(ApiEndpoints.login, data);

    if (response.success) {
      // _toastService.success(
      //     "Login for ${response.data!.data["response"]["first_name"]} successful");
      if (response.data!.statusCode == 200) {
        ToastService.success(
            "Login for ${response.data!.data["response"]["first_name"]} successful",
            context);
      } else {
        ToastService.success(
            response.data!.data["response"]["message"], context);
      }
    } else {
      //_toastService.success(response.data!.data["response"]["message"]);
      Map<String, dynamic> message =
          jsonDecode(response.data!.response.toString());
      ToastService.error(message["success"]["message"], context);
      //_toastService.error(response.data!.data["success"]["message"]);
    }
  }
}
