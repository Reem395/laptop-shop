import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_shadow_container.dart';
import '../../../widget/linear_gradient_background.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key, this.elevation = 8, this.borderRadius = 20, this.child})
      : super(key: key);

  final double elevation;
  final double borderRadius;
  final Widget? child;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

bool isFavourite = false;

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
        containerRaduis: widget.borderRadius,
        spreadRadius: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8,
                        spreadRadius: 3,
                        color: AppColor.black.withOpacity(0.25))
                  ]),
              child: Stack(alignment: const Alignment(1.25, -1), children: [
                Image.asset("assets/images/razor.png"),
                IconButton(
                  icon: Icon(
                    isFavourite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_outlined,
                    color: isFavourite ? AppColor.red : AppColor.darkGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavourite = !isFavourite;
                    });
                  },
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Acer",
                style: TextStyle(color: AppColor.primary, fontSize: 18.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: elementWidth(elementWidth: 5).w,
                  bottom: elementHeight(elementHeight: 16).h),
              child: Text(
                "Razer Blade Stealth 13",
                style: TextStyle(color: AppColor.customGrey, fontSize: 10.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: elementWidth(elementWidth: 5).w,
                // bottom: elementHeight(elementHeight: 30).h
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "30,000 EGP",
                    style:
                        TextStyle(color: AppColor.customGrey, fontSize: 10.sp),
                  ),
                  InkWell(
                    child: Container(
                        width: elementWidth(elementWidth: 50).w,
                        height: elementHeight(elementHeight: 50).h,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  AppColor.primary.withOpacity(0.85),
                                  AppColor.primary.withOpacity(0),
                                ],
                                stops: const [
                                  0.5,
                                  0.9
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: const Icon(
                          Icons.add,
                          color: AppColor.white,
                        )),
                    onTap: (() {}),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
