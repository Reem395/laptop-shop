import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_state.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/linear_gradient_background.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/rounded_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shadowed_text_form_field.dart';
import 'package:sizer/sizer.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);

  final TextEditingController _firstNumber = TextEditingController();
  final TextEditingController _secondNumber = TextEditingController();
  final TextEditingController _thirdNumber = TextEditingController();
  final TextEditingController _fourthNumber = TextEditingController();
  final TextEditingController _fifthNumber = TextEditingController();
  final TextEditingController _sixthNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: LinearGradientBackground(
        child: SafeArea(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is PhoneLoginVerificationSucess) {
                print("from if success login");
                print(
                    "code : $_firstNumber$_secondNumber$_thirdNumber$_fourthNumber$_fifthNumber$_sixthNumber");
                Navigator.pushNamed(context, "/help");
              }
            },
            builder: (context, state) {
              LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
              return SingleChildScrollView(
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
                            width: elementWidth(elementWidth: 50).w,
                            height: elementHeight(elementHeight: 60).h,
                            child: ShadowedTextFormField(
                              onChanged: (value) {
                                if (value.length == 1) node.nextFocus();
                              },
                              controller: _firstNumber,
                              keyboardType: TextInputType.number,
                              blurRadius: 10,
                              spreadRadius: 5,
                              cursorHeight: 25,
                              offsetSecondValue: 3,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                            width: elementWidth(elementWidth: 50).w,
                            height: elementHeight(elementHeight: 60).h,
                            child: ShadowedTextFormField(
                              onChanged: (value) {
                                if (value.length == 1) node.nextFocus();
                              },
                              controller: _secondNumber,
                              keyboardType: TextInputType.number,
                              blurRadius: 10,
                              spreadRadius: 5,
                              cursorHeight: 25,
                              offsetSecondValue: 3,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                            width: elementWidth(elementWidth: 50).w,
                            height: elementHeight(elementHeight: 60).h,
                            child: ShadowedTextFormField(
                              onChanged: (value) {
                                if (value.length == 1) node.nextFocus();
                              },
                              controller: _thirdNumber,
                              keyboardType: TextInputType.number,
                              blurRadius: 10,
                              spreadRadius: 5,
                              cursorHeight: 25,
                              offsetSecondValue: 3,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                            width: elementWidth(elementWidth: 50).w,
                            height: elementHeight(elementHeight: 60).h,
                            child: ShadowedTextFormField(
                              onChanged: (value) {
                                if (value.length == 1) node.nextFocus();
                              },
                              controller: _fourthNumber,
                              keyboardType: TextInputType.number,
                              blurRadius: 10,
                              spreadRadius: 5,
                              cursorHeight: 25,
                              offsetSecondValue: 3,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                            width: elementWidth(elementWidth: 50).w,
                            height: elementHeight(elementHeight: 60).h,
                            child: ShadowedTextFormField(
                              onChanged: (value) {
                                if (value.length == 1) node.nextFocus();
                              },
                              controller: _fifthNumber,
                              keyboardType: TextInputType.number,
                              blurRadius: 10,
                              spreadRadius: 5,
                              cursorHeight: 25,
                              offsetSecondValue: 3,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                            width: elementWidth(elementWidth: 50).w,
                            height: elementHeight(elementHeight: 60).h,
                            child: ShadowedTextFormField(
                              controller: _sixthNumber,
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
                          onTap: () async {
                            await cubit.verifyPhoneNumber(
                                phoneNumer: cubit.userPhone);
                          },
                          child: Text(
                            "Resend Code",
                            style: TextStyle(
                                color: AppColor.primary,
                                fontSize: 20.sp,
                                fontFamily: "Inter"),
                          )),
                    ),
                    RoundedButtton(
                        buttonTitle: "Verify",
                        buttonFunction: () {
                          cubit.checkOTP(
                              verifyId: cubit.varificationId,
                              code:
                                  "${_firstNumber.text}${_secondNumber.text}${_thirdNumber.text}${_fourthNumber.text}${_fifthNumber.text}${_sixthNumber.text}");
                          print(
                              "${_firstNumber.text}${_secondNumber.text}${_thirdNumber.text}${_fourthNumber.text}${_fifthNumber.text}${_sixthNumber.text}");
                        })
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
