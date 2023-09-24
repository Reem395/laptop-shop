import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/product_card.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home/widgets/staggered_grid.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../../data/models/products/products.dart';

class SelectedPage extends StatelessWidget {
   const SelectedPage({Key? key, required this.productList,
  this.title}) : super(key: key);
  final List<Products> productList;
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.only(
          left: elementWidth(elementWidth: 15).w,
          right: elementWidth(elementWidth: 20).w,
        ),
        child: Transform.translate(
          offset: const Offset(0, 20),
          child: StaggeredGrid(
            crossAxisCount: 2,
            itemCount: productList.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                  child: ProductCard(
                    product: productList[index],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/details",
                        arguments: productList[index]);
                  },
                ),
              );
            }),
          ),
        ),
      ),
      title??const SizedBox(),
    
    ]);
  }
}
