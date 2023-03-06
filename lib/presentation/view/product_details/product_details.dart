import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_shadow_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/linear_gradient_background.dart';
import 'package:sizer/sizer.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: elementWidth(elementWidth: 70).w,
        toolbarHeight:elementHeight(elementHeight: 70).h ,
        leading: 
        Padding(
          padding:  EdgeInsets.only(
            left: elementWidth(elementWidth: 15).w,
            bottom: elementHeight(elementHeight:8).h),
          child: CustomShadowContainer(
            containerRaduis: 15,
            offsetFirstValue: 1.5,
            spreadRadius: 3,
            blurRadius: 9,
            child: IconButton(
              icon: Padding(
                padding: EdgeInsets.only(left: elementWidth(elementWidth: 10).w),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: AppColor.lightGrey,
                ),
              ),
              onPressed: () {Navigator.pop(context);},
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: LinearGradientBackground(child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: elementWidth(elementWidth: 23).w,
            top: elementHeight(elementHeight: 16).h,
            right: elementWidth(elementWidth: 33).w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text("Predator Helios 300",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700),),
                  Padding(
                    padding: EdgeInsets.only(
                      top: elementHeight(elementHeight: 6).h,
                      bottom: elementHeight(elementHeight: 16).h),
                    child: Text("Type: Gaming Laptop",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),),
                  ),
                  CustomShadowContainer(
                    child: Image.asset("assets/images/acer.png"),
                    width: elementWidth(elementWidth: 364).w,height: elementHeight(elementHeight: 300).h,)   
            ],
          ),
        ),
      )),
    );
  }
}
