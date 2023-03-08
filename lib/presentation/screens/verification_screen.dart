import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/linear_gradient_background.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/rounded_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text_form_field.dart';
import 'package:sizer/sizer.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);

  final TextEditingController _firstNumber = TextEditingController();
  final TextEditingController _secondNumber = TextEditingController();
  final TextEditingController _thirdNumber = TextEditingController();
  final TextEditingController _fourthNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LinearGradientBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: elementHeight(elementHeight: 75).h,
                    bottom: elementHeight(elementHeight: 138).h),
                child: Text(
                  "Verify Phone",
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 25.sp,
                      fontFamily: "Inter"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: elementWidth(elementWidth: 70).w,
                      height: elementHeight(elementHeight: 80).h,
                      child: CustomTextFormField(
                        controller: _firstNumber,
                        keyboardType: TextInputType.number,
                        blurRadius: 10,
                        spreadRadius: 5,
                        cursorHeight: 25,
                        offsetSecondValue: 3,
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                      width: elementWidth(elementWidth: 70).w,
                      height: elementHeight(elementHeight: 80).h,
                      child: CustomTextFormField(
                        controller: _secondNumber,
                        keyboardType: TextInputType.number,
                        blurRadius: 10,
                        spreadRadius: 5,
                        cursorHeight: 25,
                        offsetSecondValue: 3,
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                      width: elementWidth(elementWidth: 70).w,
                      height: elementHeight(elementHeight: 80).h,
                      child: CustomTextFormField(
                        controller: _thirdNumber,
                        keyboardType: TextInputType.number,
                        blurRadius: 10,
                        spreadRadius: 5,
                        cursorHeight: 25,
                        offsetSecondValue: 3,
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                      width: elementWidth(elementWidth: 70).w,
                      height: elementHeight(elementHeight: 80).h,
                      child: CustomTextFormField(
                        controller: _fourthNumber,
                        keyboardType: TextInputType.number,
                        blurRadius: 10,
                        spreadRadius: 5,
                        cursorHeight: 25,
                        offsetSecondValue: 3,
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: elementHeight(elementHeight: 90).h,
                    bottom: elementHeight(elementHeight: 78).h),
                child: InkWell(
                    onTap: () {
                    },
                    child: Text(
                      "Resend Code",
                      style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 20.sp,
                          fontFamily: "Inter"),
                    )),
              ),
              RoundedButtton(buttonTitle: "Verify", buttonFunction: () {
                      Navigator.pushNamed(context, "/help");
              })
            ],
          ),
        ),
      ),
    );
  }
}
