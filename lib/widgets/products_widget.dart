import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../services/utils.dart';
import '../widgets/text_widget.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key? key}) : super(key: key);

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;

    final color = Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor.withOpacity(1),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Flexible(
                      child: Image.network(
                          "https://t3.ftcdn.net/jpg/03/02/21/92/360_F_302219263_NDP2Cfs8uacAeOAcaV7cppbbd2LrDoEQ.jpg",
                          fit: BoxFit.contain,
                          height: size.width * 0.10)),
                  const Spacer(),
                  PopupMenuButton(
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("Edit"),
                              onTap: () {},
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text(
                                "Delete",
                                style: TextStyle(color: Colors.red),
                              ),
                              onTap: () {},
                              value: 2,
                            )
                          ])
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      text: "₹60",
                      color: color,
                      textSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      text: "Pasta Arrabiata",
                      color: color,
                      textSize: 18,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
