import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class RoundedButtton extends StatelessWidget {
  const RoundedButtton(
      {Key? key,
      required this.buttonTitle,
      required this.buttonFunction,
      this.buttonRaduis = 28,
      this.titleSize = 20,
      this.verticalPadding = 11.48,
      this.horizontalPadding = 115,
      this.titleColor = AppColor.white})
      : super(key: key);

  final Function()? buttonFunction;
  final String buttonTitle;
  final double buttonRaduis;
  final double titleSize;
  final double verticalPadding;
  final double horizontalPadding;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFunction,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColor.primary,
                AppColor.primary.withOpacity(0.5),
                AppColor.primary.withOpacity(0.27)
              ],
              stops: const [
                0.1,
                0.8,
                1
              ]),
          borderRadius: BorderRadius.circular(buttonRaduis),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: elementHeight(elementHeight: verticalPadding).h,
              horizontal: elementWidth(elementWidth: horizontalPadding).w),
          child: Text(
            buttonTitle,
            style: TextStyle(color: titleColor, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
