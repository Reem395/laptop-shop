import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_state.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/shadowed_text_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../data/models/products/products.dart';
import '../../../widget/custom_shadow_container.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom(
      {Key? key,
      required this.searchController,
      this.topPadding = 50,
      this.boxWidth = 390})
      : super(key: key);
  final TextEditingController searchController;
  final double topPadding;
  final double boxWidth;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductState>(
      builder: (context, state) {
        ProductsCubit cubit = BlocProvider.of<ProductsCubit>(context);
        String _searchedProduct = "";
        List<Products>? productFiltered = [];
        return Padding(
          padding: EdgeInsets.only(
            top: elementHeight(elementHeight: topPadding).h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                // padding: EdgeInsets.only(right: elementWidth(elementWidth: 16).w),
                padding: EdgeInsets.only(
                    bottom: elementHeight(elementHeight: 10).h,
                    right: elementWidth(elementWidth: 0).w),
                child: CustomShadowContainer(
                    containerRaduis: 10,
                    shadowColorOpacity: 0.4,
                    spreadRadius: 1.8,
                    offsetFirstValue: 4,
                    offsetSecondValue: 3,
                    child: SizedBox(
                        width: elementWidth(elementWidth: boxWidth).w,
                        // width: elementWidth(elementWidth: 324).w,
                        height: elementHeight(elementHeight: 50).h,
                        child: ShadowedTextFormField(
                          controller: searchController,
                          hintText: "Search",
                          fontSize: 17,
                          onChanged: (text) {
                            _searchedProduct = text;
                            print("You typed: $_searchedProduct");
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 8.74),
                          suffixIcon: IconButton(
                              onPressed: () {
                                print("search");
                                productFiltered?.clear();
                                print("search send: $_searchedProduct");
                                productFiltered = [
                                  ...?cubit.searchProduct(_searchedProduct)
                                ];
                                print("filter: ${productFiltered?.length}");
                                Navigator.pushNamed(context, "/search",
                                    arguments: productFiltered);
                              },
                              icon: const Icon(Icons.search)),
                        ))),
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: elementWidth(elementWidth: 20).w),
              //   child: CustomShadowContainer(
              //       containerRaduis: 15,
              //       shadowColorOpacity: 0.4,
              //       spreadRadius: 1.8,
              //       offsetFirstValue: 4,
              //       offsetSecondValue: 3,
              //       child: SizedBox(
              //           width: elementWidth(elementWidth: 50).w,
              //           height: elementHeight(elementHeight: 55).h,
              //           child: IconButton(
              //               onPressed: () {},
              //               icon: const Icon(
              //                 Icons.filter_alt,
              //                 color: AppColor.lightGrey,
              //               )))),
              // )
            ],
          ),
        );
      },
    );
  }
}
