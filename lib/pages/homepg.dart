// TODO Implement this library.
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:deque/constants/colors.dart';
import 'package:deque/pages/tab1.dart';
import 'package:deque/pages/tab2.dart';
import 'package:deque/pages/tab3.dart';
import 'package:deque/pages/tab4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class homepg extends StatefulWidget {
  const homepg({Key? key}) : super(key: key);

  @override
  State<homepg> createState() => _homepgState();
}

class _homepgState extends State<homepg> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var selected = 0;

    return DefaultTabController(
      length: 7,
      child: Scaffold(
          backgroundColor: kBackground,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.shopping_cart),
          ),
          body: Container(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 20.00,
                  ),

                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Icon(Icons.arrow_back_rounded),
                      ),
                      Spacer(),
                      AnimSearchBar(
                        width: (MediaQuery.of(context).size.width) - 85,
                        textController: textController,
                        onSuffixTap: () {
                          setState(() {
                            textController.clear();
                          });
                        },
                        color: Colors.white,
                        helpText: "Search",
                        autoFocus: true,
                        closeSearchOnSuffixTap: true,
                        rtl: true,
                      ),
                    ],
                  ),

                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TabBar(
                        indicator: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        isScrollable: true,

                        //labelColor: ,
                        //unselectedLabelColor: ,

                        tabs: [
                          Tab(
                            text: 'Pasta',
                          ),
                          Tab(
                            text: 'Noodles',
                          ),
                          Tab(
                            text: "Beverages",
                          ),
                          Tab(
                            text: 'Burgers',
                          ),
                          Tab(
                            text: 'CAt5',
                          ),
                          Tab(
                            text: 'CAt6',
                          ),
                          Tab(
                            text: 'CAt7',
                          ),
                        ]),
                  ),

                  Expanded(
                      child: TabBarView(
                    children: [
                      tab1(),
                      tab2(),
                      tab3(),
                      tab4(),
                      Text("cat4"),
                      Text("cat4"),
                      Text("cat4"),
                    ],
                  )),

                  SizedBox(
                    height: 10,
                  )

                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: Container(
                  //     child: FloatingActionButton(onPressed: () {
                  //     },

                  //     child: Icon(Icons.shopping_cart),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          )),
    );
  }
}
