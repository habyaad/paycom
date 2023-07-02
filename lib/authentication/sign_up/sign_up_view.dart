import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paycom/authentication/login/login_view.dart';
import 'package:paycom/authentication/sign_up/sign_up_viewmodel.dart';
import 'package:paycom/utils/enums.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/app_colors.dart';
import '../../utils/common_widgets/account_type_widget.dart';
import '../../utils/common_widgets/general_button.dart';
import '../../utils/validator.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        builder: (context, viewModel, child) => Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: viewModel.formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 17,
                          ),
                          const Text(
                            "payCOM",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: AppColors.primaryColor),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Join us now",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppColors.primaryColorDark),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          TextFormField(
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                            controller: viewModel.nameController,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              labelStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor),
                              prefixIcon: Transform.scale(
                                  scale: 0.5,
                                  child: SvgPicture.asset(
                                    "assets/svgs/profile.svg",
                                    width: 20,
                                    height: 20,
                                  )),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryColor,
                                    width: 1),
                                borderRadius:
                                BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryColor,
                                    width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryColor,
                                    width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),

                            ),
                            validator: (value) =>
                                Validator.validateFullName(value),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                            controller: viewModel.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor),
                              prefixIcon: Transform.scale(
                                  scale: 0.5,
                                  child: SvgPicture.asset(
                                    "assets/svgs/email.svg",
                                    width: 20,
                                    height: 20,
                                  )),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryColor,
                                    width: 1),
                                borderRadius:
                                BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryColor,
                                    width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryColor,
                                    width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),

                            ),
                            validator: (value) =>
                                Validator.validateEmail(value),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: AppColors.secondaryColor),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  "assets/svgs/call.svg",
                                  width: 20,
                                  height: 20,
                                ),
                                CountryCodePicker(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: AppColors.primaryColor),
                                  flagWidth: 25,
                                  onChanged: (CountryCode countryCode) {
                                    print(
                                        '${countryCode.dialCode} ${countryCode.code}');
                                    viewModel.updateCountry(countryCode);
                                  },
                                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                  initialSelection: 'NG',
                                  // optional. Shows only country name and flag
                                  showCountryOnly: false,
                                  // optional. Shows only country name and flag when popup is closed.
                                  showOnlyCountryWhenClosed: false,
                                  // optional. aligns the flag and the Text left
                                  alignLeft: false,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                    controller: viewModel.phoneController,
                                    keyboardType: const TextInputType.numberWithOptions(signed: true),
                                    cursorHeight: 10,
                                    decoration: const InputDecoration(
                                        hintText: 'Phone Number',
                                        hintStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primaryColor),
                                        filled: true,
                                        fillColor: Colors.white,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none),
                                    validator: (value) =>
                                        Validator.validatePhoneNumber(value),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: viewModel.passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.primaryColor),
                                    prefixIcon: Transform.scale(
                                        scale: 0.4,
                                        child: SvgPicture.asset(
                                          "assets/svgs/lock.svg",
                                        )),
                                    suffixIcon: Transform.scale(
                                        scale: 0.4,
                                        child: SvgPicture.asset(
                                          "assets/svgs/eye.svg",
                                        )),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.secondaryColor,
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.secondaryColor,
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.circular(8.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.secondaryColor,
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.circular(8.0),
                                    ),

                                ),
                                validator: (value) =>
                                    Validator.validatePassword(value),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "*Password should contain maximum 6 characters",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: AppColors.primaryColor),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Select Account Type",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppColors.primaryColorDark),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  AccountTypeWidget(
                                    isActive: viewModel.accountType ==
                                        AccountType.user,
                                    onPressed: () {
                                      viewModel.setToUser();
                                    },
                                    text: 'User',
                                    iconName: 'profile',
                                  ),
                                  const SizedBox(
                                    width: 13,
                                  ),
                                  AccountTypeWidget(
                                    isActive: viewModel.accountType ==
                                        AccountType.merchant,
                                    onPressed: () {
                                      viewModel.setToMerchant();
                                    },
                                    text: 'Merchant',
                                    iconName: 'bank',
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              const Text(
                                "By creating an account, you agree to our terms & conditions.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          GeneralButton(
                            buttonColor: AppColors.primaryColorDark,
                            buttonText: 'Create Account',
                            textColor: Colors.white,
                            onPressed: () {
                              if (viewModel.formKey.currentState!.validate()) {
                                viewModel.formKey.currentState!.save();
                                // Do something with the validated and saved values
                                viewModel.signUp(context);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const LoginView()));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: AppColors.primaryColor),
                                ),
                                Text(
                                  "Sign in now",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: AppColors.primaryColorDark),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => SignUpViewModel());
  }
}
