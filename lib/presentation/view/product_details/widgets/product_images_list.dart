import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_state.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../widget/custom_shadow_container.dart';

class ProductImagesList extends StatelessWidget {
  const ProductImagesList({Key? key, required this.productImage})
      : super(key: key);

  final List productImage;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductState>(
      builder: (context, state) {
        return SizedBox(
          height: elementHeight(elementHeight: 108).h,
          child: ListView.builder(
              clipBehavior: Clip.hardEdge,
              padding: EdgeInsets.only(left: elementWidth(elementWidth: 20).w),
              scrollDirection: Axis.horizontal,
              itemCount: productImage.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    BlocProvider.of<ProductsCubit>(context).changeMainImage(image: productImage[index]);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: elementWidth(elementWidth: 20).w),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.5),
                      child: CustomShadowContainer(
                          spreadRadius: 3,
                          blurRadius: 3,
                          offsetFirstValue: 0,
                          offsetSecondValue: 1.5,
                          containerRaduis: 20,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: elementHeight(elementHeight: 23).h,
                                horizontal: elementWidth(elementWidth: 15).w),
                            child: productImage[index] == null
                                ? Center(
                                    child: Image.asset(
                                        "assets/images/image_error.png"))
                                : Center(
                                    child: Image.network(
                                      "${productImage[index]}",
                                      fit: BoxFit.contain,
                                      width: elementWidth(elementWidth: 71).w,
                                      height:
                                          elementHeight(elementHeight: 54).h,
                                    ),
                                  ),
                          )),
                    ),
                  ),
                );
              })),
        );
      },
    );
  }
}
