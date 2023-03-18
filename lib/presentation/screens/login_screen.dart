import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_state.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/rounded_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/rounded_image.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../styles/colors.dart';
import '../widget/shadowed_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Opacity(
        opacity: 0.85,
        child: ColorFiltered(
          colorFilter:
              ColorFilter.mode(Colors.blue.withOpacity(0.4), BlendMode.color),
          child: Image.asset(
            "assets/images/login.png",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
      bottomNavigationBar: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is PhoneValid) {
            print("from if success");
            Navigator.pushNamed(context, "/verify");
          }
        },
        builder: (context, state) {
          LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
          return Form(
            key: _formKey,
            child: Stack(clipBehavior: Clip.none, children: [
              Container(
                height: elementHeight(elementHeight: 617).h,
                decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                /**
                   * Social media login
                   */
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: elementHeight(elementHeight: 358).h,
                        bottom: elementHeight(elementHeight: 85).h,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: elementWidth(elementWidth: 28).w),
                        child: Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              color: AppColor.secondary,
                              thickness: 1.5,
                            )),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: elementWidth(elementWidth: 10).w),
                              child: Text(
                                "OR",
                                style: TextStyle(
                                  color: AppColor.primary.withOpacity(0.61),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            const Expanded(
                                child: Divider(
                              color: AppColor.secondary,
                              thickness: 1.5,
                            )),
                          ],
                        ),
                      ),
                    ),
                    /**SocialMedia Icons */
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: elementWidth(elementWidth: 110).w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: const RoundedImage(image: "fb_icon.png")),
                          InkWell(
                              onTap: () {},
                              child: const RoundedImage(image: "ios 1.png")),
                          InkWell(
                              onTap: () {},
                              child:
                                  const RoundedImage(image: "GoogleIcon.png")),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              /**
                 * contains Login fields 
                 */
              Positioned(
                bottom: elementHeight(elementHeight: 395).h,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: elementWidth(elementWidth: 29).w),
                  child: Container(
                    height: elementHeight(elementHeight: 378).h,
                    width: elementWidth(elementWidth: 372).w,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.35),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: elementHeight(elementHeight: 27.88).h,
                          ),
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 30.sp,
                                color: AppColor.customGrey),
                          ),
                        ),
                        Divider(
                          color: AppColor.primary.withOpacity(0.72),
                          thickness: 2.8,
                          indent: 75,
                          endIndent: 75,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: elementHeight(elementHeight: 42.79).h,
                              left: elementWidth(elementWidth: 46).w,
                              right: elementWidth(elementWidth: 44).w),
                          child: SizedBox(
                            height: elementHeight(elementHeight: 48.01).h,
                            child: ShadowedTextFormField(
                              controller: _fullNameController,
                              hintText: "Enter your Full Name",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please enter your name",
                                      toastLength: Toast.LENGTH_SHORT);
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: elementHeight(elementHeight: 16.95).h,
                              left: elementWidth(elementWidth: 46).w,
                              right: elementWidth(elementWidth: 44).w),
                          child: SizedBox(
                            height: elementHeight(elementHeight: 51.01).h,
                            child: ShadowedTextFormField(
                              controller: _phoneController,
                              hintText: "Enter your Phone Number",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  // return 'Please enter your phone number';
                                  Fluttertoast.showToast(
                                      msg: "Please enter your phone number",
                                      toastLength: Toast.LENGTH_SHORT);
                                }
                                return null;
                              },
                              prefixIcon: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "+2",
                                    style: TextStyle(
                                        color: AppColor.lightGrey,
                                        fontSize: 15),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 1.5,
                                    color: AppColor.lightGrey,
                                  )
                                ],
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: elementHeight(elementHeight: 31.99).h,
                          ),
                          child: RoundedButtton(
                              buttonTitle: "Login",
                              buttonFunction: cubit.loginButtonEnabled?() {
                                if (_formKey.currentState!.validate()) {}
                                if (_fullNameController.text.isNotEmpty &&
                                    _phoneController.text.isNotEmpty) {
                                  cubit.verifyPhoneNumber(
                                      phoneNumer: "+2${_phoneController.text}");
                                  cubit.loginButtonEnabled = false;
                                }
                                print("pressed");
                              }:null
                              ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
