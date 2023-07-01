import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_colors.dart';

class AccountTypeWidget extends StatelessWidget {
  final bool isActive;
  final void Function() onPressed;
  final String text;
  final String iconName;

  const AccountTypeWidget(
      {super.key,
      required this.isActive,
      required this.onPressed,
      required this.text,
      required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 140,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
                color: isActive
                    ? AppColors.primaryColorDark
                    : AppColors.secondaryColor),
            borderRadius: BorderRadius.circular(8),
            color: isActive ? AppColors.primaryColorLight : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/svgs/$iconName.svg"),
              const SizedBox(
                width: 11,
              ),
              Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
      isActive
          ? Positioned(
              top: 4, left: 7, child: SvgPicture.asset("assets/svgs/check.svg"))
          : SizedBox()
    ]);
  }
}
