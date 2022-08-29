import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../providers/dark_theme_provider.dart';
import '../services/utils.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({Key? key}) : super(key: key);

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);

    final color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                flex: size.width < 650 ? 3 : 1,
                child: Image.network(
                  "https://t3.ftcdn.net/jpg/03/02/21/92/360_F_302219263_NDP2Cfs8uacAeOAcaV7cppbbd2LrDoEQ.jpg",
                  fit: BoxFit.contain,
                )),
            SizedBox(
              width: 12,
            ),
            Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(text: "12x for Rs 720", color: color),
                    FittedBox(
                      child: Row(
                        children: [
                          TextWidget(
                            text: "By",
                            color: Colors.blue,
                            textSize: 16,
                            isTitle: true,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          TextWidget(
                            text: "Sabi",
                            color: color,
                            isTitle: true,
                            textSize: 14,
                          )
                        ],
                      ),
                    ),
                    const Text("21/08/22")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
