import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/products/products.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../styles/colors.dart';

class ProductDescriptionTab extends StatelessWidget {
  const ProductDescriptionTab(
      {Key? key,
      required this.product,
      required this.errorMsg,
      this.paddingTop = 10})
      : super(key: key);

  final Products product;
  final String errorMsg;
  final double paddingTop;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: elementHeight(elementHeight: paddingTop).h),
      child: Text(
        product.description == null
            ? errorMsg
            : product.description!,
        style: TextStyle(
          color: AppColor.lightGrey,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
