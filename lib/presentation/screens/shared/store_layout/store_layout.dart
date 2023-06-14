import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/home.dart';
import 'package:sizer/sizer.dart';

import '../../../../business_logic/login_cubit/login_cubit.dart';
import '../../../../business_logic/login_cubit/login_state.dart';
import '../../../../constants/constants.dart';
import '../../../styles/colors.dart';
import '../../../view/notification/notification_screen.dart';

class StoreLayout extends StatefulWidget {
  const StoreLayout({Key? key}) : super(key: key);

  @override
  State<StoreLayout> createState() => _StoreLayoutState();
}

class _StoreLayoutState extends State<StoreLayout> {
  List<Widget> navPages = [
    // InkWell(onTap: (){},),
    // LogoutAlert(),
    const HomeScreen(),
    const HomeScreen(),
    const NotificationScreen(),
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LogOut) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 1,
            color: AppColor.white,
            buttonBackgroundColor: AppColor.primary.withOpacity(0.75),
            backgroundColor: const Color.fromARGB(35, 220, 216, 216),
            items: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("LogOut",
                              style: TextStyle(color: AppColor.primary)),
                          content: SizedBox(
                            height: elementHeight(elementHeight: 110).h,
                            child: const Center(
                              child: Text("Are you sure you want to log out?"),
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  BlocProvider.of<LoginCubit>(context)
                                      .signOut();
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(color: AppColor.primary),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(color: AppColor.primary),
                                )),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.logout_outlined),
                color: _page == 0 ? AppColor.white : AppColor.lightGrey,
              ),
              // Icon(
              //   Icons.favorite,
              //   color: _page == 1 ? AppColor.white : AppColor.lightGrey,
              // ),
              Icon(
                Icons.home,
                color: _page == 1 ? AppColor.white : AppColor.lightGrey,
              ),
              Icon(
                Icons.notifications,
                color: _page == 2 ? AppColor.white : AppColor.lightGrey,
              ),
              // Icon(
              //   Icons.settings,
              //   color: _page == 4 ? AppColor.white : AppColor.lightGrey,
              // ),
            ],
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
          body: navPages[_page],
        );
      },
    );
  }
}
