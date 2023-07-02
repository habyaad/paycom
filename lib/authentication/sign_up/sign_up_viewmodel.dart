import 'package:cherry_toast/cherry_toast.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:paycom/model/api_response_model.dart';
import 'package:paycom/model/user_model.dart';
import 'package:paycom/services/api_endpoints.dart';
import 'package:paycom/utils/string_utils.dart';
import 'package:stacked/stacked.dart';
import '../../services/api_services.dart';
import '../../services/toast_service.dart';
import '../../utils/enums.dart';

class SignUpViewModel extends BaseViewModel {
  final ApiServices _apiServices = ApiServices();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  AccountType _accountType = AccountType.user;

  AccountType get accountType => _accountType;

  CountryCode _countryCode = CountryCode(code: 'NG', dialCode: '+234');

  CountryCode get countryCode => _countryCode;

  void updateCountry(CountryCode newCountryCode) {
    _countryCode = newCountryCode;
  }

  void setToUser() {
    _accountType = AccountType.user;
    notifyListeners();
  }

  void setToMerchant() {
    _accountType = AccountType.merchant;
    notifyListeners();
  }

  void signUp(BuildContext context) async {
    List firstLastName = StringUtils.splitFullName(nameController.text)!;

    UserModel user = UserModel(
        firstName: firstLastName[0],
        lastName: firstLastName[1],
        email: emailController.text,
        password: passwordController.text,
        defaultCountry: countryCode.code.toString(),
        carrierCode: countryCode.dialCode.toString(),
        type: "user",
        formattedPhone: phoneController.text);

    ApiResponse response =
        await _apiServices.post(ApiEndpoints.signUp, user.toJson());
    if(response.success){
      ToastService.success(
        response.data!.data["success"]["message"], context);
    }else{
      ToastService.error(
        response.data!.response["success"]["message"], context);
    }
  }
}
