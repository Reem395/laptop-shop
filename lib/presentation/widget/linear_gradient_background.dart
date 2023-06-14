import 'package:flutter/material.dart';

import '../styles/colors.dart';

class LinearGradientBackground extends StatelessWidget {
  const LinearGradientBackground({Key? key, required this.child})
      : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.h,
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColor.primary.withOpacity(0.85),
          AppColor.primary.withOpacity(0),
        ], stops: const [
          0.1,
          0.47
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: child,
    );
  }
}
