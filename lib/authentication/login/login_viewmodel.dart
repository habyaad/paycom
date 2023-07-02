import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../model/api_response_model.dart';
import '../../services/api_endpoints.dart';
import '../../services/api_services.dart';
import '../../services/toast_service.dart';

class LoginViewModel extends BaseViewModel{
  final ApiServices _apiServices = ApiServices();
  final ToastService _toastService = ToastService();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async{
    Map<String, dynamic> data = {
      "email": emailController.text,
      "password" : passwordController.text
    };
    ApiResponse response = await _apiServices.post(ApiEndpoints.login, data);
    if (response.data!.statusCode < 300) {
      _toastService.success(response.data!.data["response"]["message"]);
    } else {
      _toastService.error(response.data!.data["response"]["message"]);
    }
  }
}