import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/category_tab.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/home_header.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/linear_gradient_background.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import 'widgets/product_card.dart';
import 'widgets/search_bar.dart';
import 'widgets/staggered_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 2;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
      CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        color: AppColor.white,
        buttonBackgroundColor: AppColor.primary.withOpacity(0.75),
        backgroundColor: const Color.fromARGB(35, 220, 216, 216),
        items: [
          Icon(
            Icons.logout_outlined,
            color: _page == 0 ? AppColor.white : AppColor.lightGrey,
          ),
          Icon(
            Icons.favorite,
            color: _page == 1 ? AppColor.white : AppColor.lightGrey,
          ),
          Icon(
            Icons.home,
            color: _page == 2 ? AppColor.white : AppColor.lightGrey,
          ),
          Icon(
            Icons.notifications,
            color: _page == 3 ? AppColor.white : AppColor.lightGrey,
          ),
          Icon(
            Icons.settings,
            color: _page == 4 ? AppColor.white : AppColor.lightGrey,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
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
                SearchBar(),
                /**Header */
                const HomeHeader(),
                /**Tabs*/
                Padding(
                  padding: EdgeInsets.only(
                    top: elementHeight(elementHeight: 14).h,
                    right: elementWidth(elementWidth: 20).w,
                  ),
                  child: SizedBox(
                    height: 52,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      children: [
                        CategoryTab(
                          image: "vector-trophy-cup-icon 1.png",
                          tabTitle: "All",
                          onTap: () {
                            // print("object");
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: elementWidth(elementWidth: 25).w),
                          child: const CategoryTab(
                            image:
                                "309-3098835_predator-tlcs-2017-acer-predator-logo-vector 1.png",
                            tabTitle: "Acer",
                          ),
                        ),
                        const CategoryTab(
                          image: "Razer-Logo 1.png",
                          tabTitle: "Razor",
                        ),
                      ],
                    ),
                  ),
                )
                /**Products */,
                Expanded(
                  child: Stack(children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: elementWidth(elementWidth: 15).w,
                        right: elementWidth(elementWidth: 20).w,
                      ),
                      child: Transform.translate(
                        offset: const Offset(0, 20),
                        child: StaggeredGrid(
                          crossAxisCount: 2,
                          itemCount: 6,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: EdgeInsets.all(6.0),
                              child: InkWell(child: ProductCard(),
                              onTap: () {
                               Navigator.pushNamed(context, "/details");
                              },),
                            );
                          }),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: elementHeight(elementHeight: 23).h,
                        left: elementWidth(elementWidth: 15).w,
                      ),
                      child: Container(
                          color: AppColor.white,
                          child: Text(
                            "Recomended\nfor You",
                            style: TextStyle(
                                fontSize: 20.sp, color: AppColor.customGrey),
                          )),
                    ),
              
                  
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
