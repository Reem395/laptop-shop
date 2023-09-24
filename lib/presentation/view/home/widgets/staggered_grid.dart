import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:sizer/sizer.dart';

class StaggeredGrid extends StatelessWidget {
  const StaggeredGrid({
    Key? key,
    required this.itemBuilder,
    required this.crossAxisCount,
    required this.itemCount,
    this.crossAxisSpacing = 19,
    this.mainAxisSpacing = 16,
    this.childAspectRatio = 0.59,
  }) : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int crossAxisCount;
  final int itemCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        final width = boxConstraints.maxWidth;
        final itemHeight = (width * 0.5) / childAspectRatio;
        return GridView.builder(
          padding: EdgeInsets.only(bottom: itemHeight / 2),
          itemCount: itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: elementHeight(elementHeight: mainAxisSpacing).h,
            crossAxisSpacing: elementWidth(elementWidth: crossAxisSpacing).w,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Transform.translate(
              offset: Offset(0, index.isEven ? 100 : 0),
              // offset: Offset(0, index.isEven ? 50 : 0),
              child: itemBuilder(context, index),
            );
          },
        );
      },
    );
  }
}
