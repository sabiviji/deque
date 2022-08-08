import 'dart:ui';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';

class tab3 extends StatefulWidget {
  @override
  State<tab3> createState() => _tab3State();
}

class _tab3State extends State<tab3> {
  List<int> counter = [0, 0, 0, 0, 0];

  List prices = ['₹ 20', '₹ 30', '₹ 40', '₹ 20'];

  List pictures = [
    'https://vaya.in/recipes/wp-content/uploads/2018/05/Coffee.jpg',
    'https://images.unsplash.com/photo-1584286595398-a59f21d313f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29sZCUyMGNvZmZlZXxlbnwwfHwwfHw%3D&w=1000&q=80',
    'https://images.pexels.com/photos/7333831/pexels-photo-7333831.jpeg?auto=compress&cs=tinysrgb&h=566.525&fit=crop&w=633.175&dpr=1',
    'https://www.teaforturmeric.com/wp-content/uploads/2021/11/Masala-Chai-Tea-Recipe-Card.jpg'
  ];

  List Names = ['Coffee ', 'Cold\nCoffee', 'Double\nCoffee', 'Tea'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 10,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFFF5F5F5),
      ),
      child: ListView.builder(
          itemCount: 4,
          shrinkWrap: false,
          itemBuilder: (BuildContext context, index) => Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Container(
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * (1 / 6),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.center,
                                    child: Container(
                                      width: 55.0,
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Container(
                                        width: 55.0,
                                        height: 55.0,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            child:
                                                Image.network(pictures[index])),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 17,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        width: 100,
                                        child: Text(
                                          Names[index],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional.bottomEnd,
                                        child: Text(prices[index],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.pinkAccent,
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              child: IconButton(
                                                iconSize: 15,
                                                splashRadius: 13,
                                                onPressed: (() {
                                                  setState(() {
                                                    if (counter[index] > 0)
                                                      counter[index]--;
                                                  });
                                                }),
                                                icon: Icon(Icons.remove),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text("${counter[index]}"),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              child: IconButton(
                                                iconSize: 15,
                                                splashRadius: 13,
                                                onPressed: (() {
                                                  setState(() {
                                                    counter[index]++;
                                                  });
                                                }),
                                                icon: Icon(Icons.add),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
