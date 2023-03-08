import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/rounded_image.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_shadow_container.dart';


class CategoryTab extends StatelessWidget {
   const CategoryTab({Key? key,
   required this.image,
   required this.tabTitle,
   this.onTap,
  }) : super(key: key);

  final String image;
  final String tabTitle;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: SizedBox(
        // width: elementWidth(elementWidth: 135).w,
        child: CustomShadowContainer(
          // backgroundColor: Colors.transparent,
          spreadRadius: 3,
            child:
             Padding(
               padding: EdgeInsets.only(
                left: elementWidth(elementWidth: 8).w,
               ),
               child: Row(
                 children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical:elementHeight(elementHeight: 6).h ),
                    child: RoundedImage(image: image,),
                  ),
                   Padding(
                     padding:  EdgeInsets.symmetric(
                      horizontal: elementWidth(elementWidth: 12).w
                     ),
                     child: Text(tabTitle ,style: const TextStyle(color: Colors.black,fontSize: 20)),
                   ),
                 ],
               ),
             ),
             containerRaduis: 30,
        ),
      ),
    );
  }
}