import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';


class RoundedButtton extends StatelessWidget {
  const RoundedButtton({Key? key,
   required this.buttonTitle,
    required this.buttonFunction}) : super(key: key);

  final String buttonTitle;
  final VoidCallback buttonFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColor.primary,
            AppColor.primary.withOpacity(0.5),
            AppColor.primary.withOpacity(0.27)
          ],
          ),
          borderRadius: BorderRadius.circular(28),
      ),
      child: ElevatedButton(
        onPressed: buttonFunction, child: Text(buttonTitle),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400),
          padding:EdgeInsets.symmetric(
            vertical:elementHeight(elementHeight: 11.48).h,
            horizontal: elementWidth(elementWidth: 115).w
             ),
          shape: 
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))
        ),
      ),
    );
  }
}