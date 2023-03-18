import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class ShadowedTextFormField extends StatelessWidget {
  const ShadowedTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.blurRadius = 5,
    this.spreadRadius = 1,
    this.borderRadius = 10,
    this.textColor = AppColor.lightGrey,
    this.fontSize = 10,
    this.offsetFirstValue = 0,
    this.offsetSecondValue = 0,
    this.shadowColor = AppColor.black,
    this.keyboardType,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 11, vertical: 17.74),
    this.cursorHeight,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? cursorHeight;
  final double borderRadius;
  final double blurRadius;
  final double spreadRadius;
  final double offsetFirstValue;
  final double offsetSecondValue;
  final double fontSize;
  final Color textColor;
  final Color shadowColor;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
              blurRadius: blurRadius,
              offset: Offset(offsetFirstValue, offsetSecondValue),
              color: shadowColor.withOpacity(0.25),
              spreadRadius: spreadRadius)
        ],
      ),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        cursorHeight: cursorHeight,
        textAlign: textAlign,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            contentPadding: contentPadding,
            hintText: hintText,
            hintStyle: TextStyle(
                color: textColor,
                fontSize: fontSize.sp,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
