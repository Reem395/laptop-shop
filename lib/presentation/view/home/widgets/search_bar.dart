import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/text_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../styles/colors.dart';
import '../../../widget/custom_shadow_container.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: elementHeight(elementHeight: 50).h,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: elementWidth(elementWidth: 16).w),
            child: CustomShadowContainer(
                containerRaduis: 10,
                shadowColorOpacity: 0.4,
                spreadRadius: 1.8,
                offsetFirstValue: 4,
                offsetSecondValue: 3,
                child: SizedBox(
                    width: elementWidth(elementWidth: 324).w,
                    height: elementHeight(elementHeight: 50).h,
                    child: CustomTextFormField(
                      controller: _searchController,
                      hintText: "Search",
                      fontSize: 17,
                      contentPadding: const EdgeInsets.all(10),
                      suffixIcon: IconButton(
                          onPressed: () {
                            print("search");
                          },
                          icon: const Icon(Icons.search)),
                    ))),
          ),
          Padding(
            padding: EdgeInsets.only(right: elementWidth(elementWidth: 20).w),
            child: CustomShadowContainer(
                containerRaduis: 15,
                shadowColorOpacity: 0.4,
                spreadRadius: 1.8,
                offsetFirstValue: 4,
                offsetSecondValue: 3,
                child: SizedBox(
                    width: elementWidth(elementWidth: 50).w,
                    height: elementHeight(elementHeight: 55).h,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_alt,
                          color: AppColor.lightGrey,
                        )))),
          )
        ],
      ),
    );
  }
}
