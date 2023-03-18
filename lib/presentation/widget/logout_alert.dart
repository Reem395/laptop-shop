import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_state.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';

class LogoutAlert extends StatelessWidget {
  const LogoutAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LogOut) {
          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => true);
        }
      },
      builder: (context, state) {
        return InkWell(
            child: Center(child: Text("data")),
            onTap: () {
              print("from ink");
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
                              BlocProvider.of<LoginCubit>(context).signOut();
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
            });
      },
    );
  }
}
