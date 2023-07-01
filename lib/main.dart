import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paycom/utils/app_colors.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

import 'authentication/sign_up/sign_up_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashView(
          backgroundColor: AppColors.primaryColor,
          logo: Image.asset("assets/images/paycom.png"),
          done: Done(const SignUpView()),
        ));
  }
}
