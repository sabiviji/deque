import 'dart:ui';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';

class tab1 extends StatefulWidget {
  @override
  State<tab1> createState() => _tab1State();
}

class _tab1State extends State<tab1> {
  List<int> counter = [0, 0, 0, 0, 0];
  List prices = ['₹ 60', '₹ 70', '₹ 80', '₹ 90'];

  List pictures = [
    'https://sixhungryfeet.com/wp-content/uploads/2020/06/Pasta-Arrabiata-7.jpg',
    'https://www.whiskaffair.com/wp-content/uploads/2021/05/White-Sauce-Paste-2-3.jpg',
    'https://static.onecms.io/wp-content/uploads/sites/19/2007/12/12/cheese-pasta-sl-1694205-x.jpg',
    'https://static.toiimg.com/thumb/81444908.cms?imgsize=380960&width=800&height=800'
  ];

  List Names = [
    'Pasta\nArrabiata ',
    'Pasta White\nSauce',
    'Pasta White\nw/cheese',
    'Pasta Red\nw/cheese'
  ];

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
