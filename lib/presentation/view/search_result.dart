import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../data/models/products/products.dart';
import '../widget/arrow_shadow_button.dart';
import '../widget/linear_gradient_background.dart';
import 'home/widgets/search_bar.dart';
import 'home/widgets/selected_page.dart';

class SearchResult extends StatelessWidget {
  SearchResult({Key? key, required this.products}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  final List<Products>? products;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // return false;
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
        return false;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leadingWidth: elementWidth(elementWidth: 56).w,
          toolbarHeight: elementHeight(elementHeight: 56).h,
          leading: Padding(
              padding: EdgeInsets.only(
                  left: elementWidth(elementWidth: 10).w,
                  bottom: elementHeight(elementHeight: 8).h),
              child: ArrowShadowContainer(
                iconSize: 23,
                icon: Icons.arrow_back_ios,
                onPressed: () {
                  // productCubit.mainImage = "";
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/home", (route) => false);
                },
              )),
          title: SearchBarCustom(
            boxWidth: 324,
            topPadding: 10,
            searchController: _searchController,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: LinearGradientBackground(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: elementWidth(elementWidth: 20).w,
                // bottom: 50
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /**Search  */
                  // SearchBar(
                  //   topPadding: 10,
                  //   searchController: _searchController,
                  // ),
                  /**Result */
                  products == null || products!.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(
                              "No Products Found!",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        )
                      : Expanded(
                          child: SelectedPage(
                            productList: products!,
                            title: null,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
