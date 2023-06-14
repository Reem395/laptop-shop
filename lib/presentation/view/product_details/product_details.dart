import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_state.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/data/models/products/products.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/arrow_shadow_button.dart';
import 'package:magdsoft_flutter_structure/presentation/view/product_details/widgets/product_description_tab.dart';
import 'package:magdsoft_flutter_structure/presentation/view/product_details/widgets/product_images_list.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_shadow_container.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/linear_gradient_background.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/rounded_button.dart';
import 'package:sizer/sizer.dart';

// import '../../../data/models/products/products.dart';
class ProductDetails extends StatelessWidget {
  const ProductDetails(
      // this.mainImage,
      {Key? key,
      required this.product})
      : super(key: key);
  final Products product;
  // String mainImage;
  @override
  Widget build(BuildContext context) {
     ProductsCubit productCubit =BlocProvider.of<ProductsCubit>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: elementWidth(elementWidth: 70).w,
        toolbarHeight: elementHeight(elementHeight: 70).h,
        leading: Padding(
            padding: EdgeInsets.only(
                left: elementWidth(elementWidth: 15).w,
                bottom: elementHeight(elementHeight: 8).h),
            child: ArrowShadowContainer(
              icon: Icons.arrow_back_ios,
              onPressed: () {
                productCubit.mainImage = "";
                Navigator.pop(context);
              },
            )),
        backgroundColor: Colors.transparent,
      ),
      body: DefaultTabController(
        length: 2,
        child: LinearGradientBackground(
            child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: elementWidth(elementWidth: 18).w,
                top: elementHeight(elementHeight: 10).h,
                right: elementWidth(elementWidth: 28).w),
            child: BlocBuilder<ProductsCubit, ProductState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${product.model}",
                      style: TextStyle(
                          color: AppColor.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: elementHeight(elementHeight: 6).h,
                          bottom: elementHeight(elementHeight: 8).h),
                      child: Text(
                        "Type: ${product.type}",
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                            horizontal: elementWidth(elementWidth: 5).h,
                            vertical: elementHeight(elementHeight: 8).h),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: elementWidth(elementWidth: 10).w,
                                  bottom: elementHeight(elementHeight: 18).h),
                              child: CustomShadowContainer(
                                containerRaduis: 20,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        elementHeight(elementHeight: 30).h,
                                  ),
                                  child: product.images == null
                                      ? const Center(
                                          child: Text("Image Provider Error"),
                                        )
                                      : Center(
                                          child: Image.network(
                                            // "${product.images![0]}",
                                            // BlocProvider.of<ProductsCubit>(context).mainImage=product.images![0],
                                            BlocProvider.of<ProductsCubit>(
                                                        context)
                                                    .mainImage
                                                    .isEmpty
                                                ? BlocProvider.of<
                                                        ProductsCubit>(context)
                                                    .setMainImage(product)
                                                : BlocProvider.of<
                                                        ProductsCubit>(context)
                                                    .mainImage,
                                            fit: BoxFit.fill,
                                            width:
                                                elementWidth(elementWidth: 277)
                                                    .w,
                                            height: elementHeight(
                                                    elementHeight: 220)
                                                .h,
                                          ),
                                        ),
                                ),
                                width: elementWidth(elementWidth: 364).w,
                                height: elementHeight(elementHeight: 240).h,
                              ),
                            ),

                            /**product detailed images*/

                            ProductImagesList(
                              productImage: product.images!,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: elementHeight(elementHeight: 15).h),
                              child: CustomShadowContainer(
                                child: ListTile(
                                    leading: CustomShadowContainer(
                                      child: Image.asset(
                                          "assets/images/acer_logo.png"),
                                    ),
                                    title: const Text("Acer Official Store"),
                                    subtitle: const Text("View Store"),
                                    trailing: ArrowShadowContainer(
                                      width: 30,
                                      height: 30,
                                      iconSize: 12,
                                      containerRaduis: 5,
                                      icon: Icons.arrow_forward_ios,
                                      iconColor: AppColor.primary,
                                      iconInnerLeftPadding: 2,
                                      onPressed: () {},
                                    )),
                              ),
                            ),

                            /**Item Price/Add To Cart */

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                          color: AppColor.lightGrey,
                                          fontSize: 12.sp),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: elementHeight(elementHeight: 5)
                                              .h),
                                      child: Text(
                                        NumberFormat.currency(
                                                decimalDigits: 0,
                                                symbol: 'EGP',
                                                locale: 'eu')
                                            .format(product.price),
                                        style: TextStyle(
                                            color: AppColor.darkGrey,
                                            fontSize: 15.sp),
                                      ),
                                    ),
                                  ],
                                ),
                                RoundedButtton(
                                    buttonRaduis: 10,
                                    titleSize: 15,
                                    verticalPadding: 10,
                                    horizontalPadding: 50,
                                    buttonTitle: "Add To Cart",
                                    buttonFunction: () {}),
                              ],
                            ),
                            /**Divider */
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: elementHeight(elementHeight: 12).h),
                              child: Divider(
                                thickness: 2,
                                indent: elementWidth(elementWidth: 18).w,
                                endIndent: elementWidth(elementWidth: 18).w,
                              ),
                            ),

                            /**Tab Bar */

                            TabBar(
                              labelColor: AppColor.black,
                              unselectedLabelColor: AppColor.lightGrey,
                              padding: EdgeInsets.only(
                                  bottom: elementHeight(elementHeight: 20).h),
                              tabs: [
                                Text('Overview',
                                    style: TextStyle(fontSize: 12.5.sp)),
                                Text('Spesification',
                                    style: TextStyle(fontSize: 12.5.sp)),
                              ],
                              indicator: ContainerTabIndicator(
                                  width: 12.5,
                                  height: 30,
                                  radius: BorderRadius.circular(8.0),
                                  padding: const EdgeInsets.only(top: 18),
                                  borderWidth: 2.0,
                                  borderColor: AppColor.primary,
                                  color: AppColor.primary),
                            ),
                            SizedBox(
                              height: 100.h,
                              child: TabBarView(
                                children: [
                                  ProductDescriptionTab(
                                      product: product,
                                      errorMsg: "No overView To Show"),
                                  ProductDescriptionTab(
                                      product: product,
                                      errorMsg: "No Specifications To Show"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        )),
      ),
    );
  }
}
