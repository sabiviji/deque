import 'package:flutter/material.dart';
import '../consts/constants.dart';
import '../inner_screens/AddProducts.dart';
import '../responsive.dart';
import '../services/global_method.dart';
import '../services/utils.dart';
import '../widgets/GridProduct.dart';
import '../widgets/buttons.dart';
import '../widgets/header.dart';
import '../widgets/orders_list.dart';
import '../widgets/orders_widget.dart';
import '../widgets/products_widget.dart';
import '../widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../controllers/MenuController.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    return SafeArea(
      child: SingleChildScrollView(
        controller: ScrollController(),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: "Dashboard",
              fct: () {
                context.read<MenuController>().controlDashboarkMenu();
              },
            ),
            TextWidget(text: "Latest Products", color: color),
            const SizedBox(height: defaultPadding),
            Row(
              children: [
                ButtonsWidget(
                    onPressed: () {},
                    text: "View all",
                    icon: Icons.store,
                    backgroundColor: Colors.blue),
                Spacer(),
                ButtonsWidget(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                          ctx: context, routeName: UploadProductForm.routeName);
                    },
                    text: "Add Item",
                    icon: Icons.add,
                    backgroundColor: Colors.blue)
              ],
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Responsive(
                        mobile: ProductGrid(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                          childAspectRatio:
                              size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                        ),
                        desktop:
                            ProductGrid(crossAxisCount: 4, childAspectRatio: 1),
                      ),
                      SizedBox(height: defaultPadding),
                      OrderList(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
