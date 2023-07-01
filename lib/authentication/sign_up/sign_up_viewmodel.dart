import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../utils/enums.dart';

class SignUpViewModel extends BaseViewModel{
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  AccountType _accountType = AccountType.user;

  AccountType get accountType => _accountType;

  void setToUser(){
    _accountType = AccountType.user;
    notifyListeners();
  }

  void setToMerchant(){
    _accountType = AccountType.merchant;
    notifyListeners();
  }

  void signUp(){

  }
}