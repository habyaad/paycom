import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/app_colors.dart';
import '../../utils/common_widgets/general_button.dart';
import '../../utils/validator.dart';
import '../sign_up/sign_up_view.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
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
                            "Welcome",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppColors.primaryColorDark),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          TextFormField(
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
                                    color: AppColors.secondaryColor, width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryColor, width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryColor, width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            validator: (value) =>
                                Validator.validateEmail(value),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
                                    color: AppColors.secondaryColor, width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryColor, width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.secondaryColor, width: 1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            validator: (value) =>
                                Validator.validatePassword(value),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: AppColors.primaryColorDark),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          GeneralButton(
                            buttonColor: AppColors.primaryColorDark,
                            buttonText: 'Sign in',
                            textColor: Colors.white,
                            onPressed: () {
                              if (viewModel.formKey.currentState!.validate()) {
                                viewModel.formKey.currentState!.save();
                                // Do something with the validated and saved values
                                viewModel.signIn(context);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const SignUpView()));
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: AppColors.primaryColor),
                                ),
                                Text(
                                  "Register now",
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
        viewModelBuilder: () => LoginViewModel());
  }
}
