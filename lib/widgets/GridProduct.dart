import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/products_widget.dart';

import '../consts/constants.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid(
      {Key? key,
      required this.crossAxisCount,
      required this.childAspectRatio,
      this.IsinMain = true})
      : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final bool IsinMain;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: IsinMain ? 4 : 25,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) {
          return ProductsWidget();
        });
  }
}
