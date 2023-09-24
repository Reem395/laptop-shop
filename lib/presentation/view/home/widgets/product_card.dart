import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_shadow_container.dart';
import '../../../../data/models/products/products.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key, this.elevation = 8, this.borderRadius = 20, this.child,
       required this.product})
      : super(key: key);

  final double elevation;
  final double borderRadius;
  final Widget? child;
  final Products product;

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
            Expanded(
              child: Container(
                width: double.infinity,
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
                  // Image.asset("assets/images/razor.png"),
                  widget.product.images![0]==null?const Center(child: Text("Image Provider Error"),):
                  Center(
                    child: Image.network("${widget.product.images![0]}",
                    fit: BoxFit.contain,
                    width: elementWidth(elementWidth: 145).w,
                    height: elementHeight(elementHeight: 150).h,),
                  ),
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
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: elementHeight(elementHeight: 8).h,
                  left: elementWidth(elementWidth: 9).w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.product.brand}",
                    style: TextStyle(color: AppColor.primary, fontSize: 18.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: elementHeight(elementHeight: 5).h,
                        bottom: elementHeight(elementHeight: 16).h),
                    child: Text(
                      "${widget.product.model}",
                      style: TextStyle(
                          color: AppColor.customGrey, fontSize: 10.sp),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        NumberFormat.currency(decimalDigits:0,symbol:'EGP',locale: 'eu').format(widget.product.price),
                        style: TextStyle(
                            color: AppColor.customGrey, fontSize: 10.sp),
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
                ],
              ),
            ),
          ],
        ));
  }
}
