import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Color textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? height;
  final double? borderRadius;
  final Border? border;
  final void Function() onPressed;

  const GeneralButton(
      {super.key,
        required this.buttonColor,
        required this.buttonText,
        required this.textColor,
        required this.onPressed,
        this.borderRadius,
        this.height,
        this.fontWeight,
        this.fontSize,
        this.border});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child:  Ink(
        height: height?? 45,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: border,
          borderRadius:
          BorderRadius.circular(borderRadius?? 5),
          color: buttonColor,
          //border: Border.all(width: 3, color: AppColor.primary)
        ),
        child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize?? 15,
                  fontWeight: fontWeight?? FontWeight.w500),
            )),
      ),
    );
  }
}