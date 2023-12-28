<<<<<<< HEAD
import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_state.dart';
import 'package:magdsoft_flutter_structure/data/models/products/products.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/category_tab.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/home_header.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/linear_gradient_background.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../widget/customized_title.dart';
import 'widgets/search_bar.dart';
import 'widgets/selected_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final int _page = 1;
  final TextEditingController _searchController = TextEditingController();

  List<Products> productList = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getProduct();
  }

  int? _tabCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: BlocConsumer<ProductsCubit, ProductState>(
          listener: (context, state) {
            if (state is ProductSucces) {
              productList.clear();
              productList = [
                ...BlocProvider.of<ProductsCubit>(context).allProducts
              ];
            }
          },
          builder: (context, state) {
            ProductsCubit productCubit =
                BlocProvider.of<ProductsCubit>(context);
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              if (tabController.indexIsChanging) {
                setState(() {
                  _tabCurrentIndex = tabController.index;
                });
                productList.clear();
                productList
                    .addAll(productCubit.changeCategoryPage(_tabCurrentIndex!));
              }
            });
            return LinearGradientBackground(
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
                      SearchBarCustom(
                        searchController: _searchController,
                      ),
                      /**Header */
                      const HomeHeader(),
                      /**Tabs*/
                      Padding(
                        padding: EdgeInsets.only(
                          top: elementHeight(elementHeight: 14).h,
                          right: elementWidth(elementWidth: 20).w,
                        ),
                        child: TabBar(
                          padding: EdgeInsets.symmetric(
                              vertical: elementHeight(elementHeight: 5).h),
                          isScrollable: true,
                          labelColor: AppColor.white,
                          unselectedLabelColor: AppColor.black,
                          tabs: [
                            CategoryTab(
                              backgroundColor: _tabCurrentIndex == 0
                                  ? AppColor.primary
                                  : AppColor.white,
                              image: "vector-trophy-cup-icon 1.png",
                              tabTitle: "All",
                            ),
                            CategoryTab(
                              backgroundColor: _tabCurrentIndex == 1
                                  ? AppColor.primary
                                  : AppColor.white,
                              image:
                                  "309-3098835_predator-tlcs-2017-acer-predator-logo-vector 1.png",
                              tabTitle: "Acer",
                            ),
                            CategoryTab(
                              backgroundColor: _tabCurrentIndex == 2
                                  ? AppColor.primary
                                  : AppColor.white,
                              image: "Razer-Logo 1.png",
                              tabTitle: "Razer",
                            ),
                          ],
                          indicator: ContainerTabIndicator(
                            radius:
                                const BorderRadius.all(Radius.circular(30.0)),
                            color: AppColor.primary,
                            width: elementWidth(elementWidth: 100).w,
                            height: elementHeight(elementHeight: 40).h,
                            // borderWidth: 2.0,
                            borderColor: AppColor.primary,
                          ),
                        ),
                      )
                      /**Products */,
                      state is ProductLoading
                          ? const Expanded(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.primary,
                                ),
                              ),
                            )
                          : state is ProductFailed
                              ? const Expanded(
                                  child: Center(
                                    child: Text(
                                      "Something went wrong please try again later",
                                      style:
                                          TextStyle(color: AppColor.customGrey),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: TabBarView(children: [
                                    SelectedPage(
                                      productList: productList,
                                      title: const CustomizedTitle(),
                                    ),
                                    SelectedPage(
                                      productList: productList,
                                      title: const CustomizedTitle(),
                                    ),
                                    SelectedPage(
                                      productList: productList,
                                      title: const CustomizedTitle(),
                                    ),
                                  ]),
                                ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
=======
import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/products_cubit/products_state.dart';
import 'package:magdsoft_flutter_structure/data/models/products/products.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/category_tab.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/home_header.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/linear_gradient_background.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../widget/customized_title.dart';
import 'widgets/search_bar.dart';
import 'widgets/selected_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final int _page = 1;
  final TextEditingController _searchController = TextEditingController();

  List<Products> productList = [];
  // final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getProduct();
  }

  int? _tabCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: BlocConsumer<ProductsCubit, ProductState>(
          listener: (context, state) {
            if (state is ProductSucces) {
              productList.clear();
              productList = [
                ...BlocProvider.of<ProductsCubit>(context).allProducts
              ];
            }
          },
          builder: (context, state) {
            ProductsCubit productCubit =
                BlocProvider.of<ProductsCubit>(context);
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              if (tabController.indexIsChanging) {
                setState(() {
                  _tabCurrentIndex = tabController.index;
                });
                productList.clear();
                productList
                    .addAll(productCubit.changeCategoryPage(_tabCurrentIndex!));
              }
            });
            return LinearGradientBackground(
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
                      SearchBarCustom(
                        searchController: _searchController,
                      ),
                      /**Header */
                      const HomeHeader(),
                      /**Tabs*/
                      Padding(
                        padding: EdgeInsets.only(
                          top: elementHeight(elementHeight: 14).h,
                          right: elementWidth(elementWidth: 20).w,
                        ),
                        child: TabBar(
                          padding: EdgeInsets.symmetric(
                              vertical: elementHeight(elementHeight: 5).h),
                          isScrollable: true,
                          labelColor: AppColor.white,
                          unselectedLabelColor: AppColor.black,
                          tabs: [
                            CategoryTab(
                              backgroundColor: _tabCurrentIndex == 0
                                  ? AppColor.primary
                                  : AppColor.white,
                              image: "vector-trophy-cup-icon 1.png",
                              tabTitle: "All",
                            ),
                            CategoryTab(
                              backgroundColor: _tabCurrentIndex == 1
                                  ? AppColor.primary
                                  : AppColor.white,
                              image:
                                  "309-3098835_predator-tlcs-2017-acer-predator-logo-vector 1.png",
                              tabTitle: "Acer",
                            ),
                            CategoryTab(
                              backgroundColor: _tabCurrentIndex == 2
                                  ? AppColor.primary
                                  : AppColor.white,
                              image: "Razer-Logo 1.png",
                              tabTitle: "Razer",
                            ),
                          ],
                          indicator: ContainerTabIndicator(
                            radius:
                                const BorderRadius.all(Radius.circular(30.0)),
                            color: AppColor.primary,
                            width: elementWidth(elementWidth: 100).w,
                            height: elementHeight(elementHeight: 40).h,
                            // borderWidth: 2.0,
                            borderColor: AppColor.primary,
                          ),
                        ),
                      )
                      /**Products */,
                      state is ProductLoading
                          ? const Expanded(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.primary,
                                ),
                              ),
                            )
                          : state is ProductFailed
                              ? const Expanded(
                                  child: Center(
                                    child: Text(
                                      "Something went wrong please try again later",
                                      style:
                                          TextStyle(color: AppColor.customGrey),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: TabBarView(children: [
                                    SelectedPage(
                                      productList: productList,
                                      title: const CustomizedTitle(),
                                    ),
                                    SelectedPage(
                                      productList: productList,
                                      title: const CustomizedTitle(),
                                    ),
                                    SelectedPage(
                                      productList: productList,
                                      title: const CustomizedTitle(),
                                    ),
                                  ]),
                                ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
>>>>>>> 2f93acf63d83909c339102c7743a7f497c254a9c
