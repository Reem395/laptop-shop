import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/expansion_card.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/linear_gradient_background.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/rounded_button.dart';
import 'package:sizer/sizer.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinearGradientBackground(
          child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: elementWidth(elementWidth: 16).w,
            ),
            child: Column(
              children: [
                Text(
                  "Help",
                  style: TextStyle(
                      fontSize: 30.sp,
                      fontFamily: "Inter",
                      color: AppColor.white),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: elementHeight(elementHeight: 65).h,
                      bottom: elementHeight(elementHeight: 27).h),
                  child: const ExpansionCard(
                      title: "Account",
                      body:
                          "You need to create an account to use the application but you can delete your account any time you want"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: elementHeight(elementHeight: 27).h),
                  child: const ExpansionCard(
                      title: "Data", body: "your data is safe and secure"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: elementHeight(elementHeight: 27).h),
                  child: const ExpansionCard(
                      title: "Fees", body: "your data is safe and secure"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: elementHeight(elementHeight: 27).h),
                  child: const ExpansionCard(
                      title: "Content", body: "your data is safe and secure"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: elementHeight(elementHeight: 27).h),
                  child: const ExpansionCard(
                      title: "Service", body: "your data is safe and secure"),
                ),
                Padding(
                  padding:EdgeInsets.only(
                    top: elementHeight(elementHeight: 80).h,
                  ),
                  child: RoundedButtton(buttonTitle: "Continue", buttonFunction: (){}),
                )
              
              ],
            ),
          ),
        ),
      )),
    );
  }
}
