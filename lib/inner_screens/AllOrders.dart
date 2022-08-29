import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/orders_list.dart';
import 'package:provider/provider.dart';

import '../controllers/MenuController.dart';
import '../responsive.dart';
import '../services/utils.dart';
import '../widgets/GridProduct.dart';
import '../widgets/side_menu.dart';
import '../widgets/header.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({Key? key}) : super(key: key);

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      key: context.read<MenuController>().getOrdersscaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [
                    Header(
                      title: "All Orders",
                      fct: () {
                        context.read<MenuController>().controlProductsMenu();
                      },
                    ),
                    OrderList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
