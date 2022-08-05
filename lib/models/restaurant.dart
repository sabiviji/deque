
import 'package:deq/models/food.dart';

class Restaurant {
  String name;
  String logoUrl;
  String desc;

  num score;
  Map<String,List<Food>> menu;

  Restaurant(this.name,
  this.logoUrl,
  this.desc,
  this.score,
  this.menu,);

}