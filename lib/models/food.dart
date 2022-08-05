import 'dart:html';

import 'package:flutter/cupertino.dart';

class Food{
  String name;
  String logoUrl;
  String desc;

  num score;

  Food(this.name,
  this.logoUrl,
  this.desc,
  this.score,
);

  static List<Food> generateRecmmendFoods() {
    return[

      Food(
        "pasta",Image.network('https://tastesbetterfromscratch.com/wp-content/uploads/2020/03/Penne-Arrabbiata-1-2-500x500.jpg').toString(),
        "This is red sauce pasta",
        20
      ),
    ];
  }

}