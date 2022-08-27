import 'package:deque/utils/colors.dart';
import 'package:flutter/material.dart';
import 'utils/morning_card.dart';
import 'utils/canteens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/customscroll.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List canteen_cards = [
    ['South Canteen'],
    ['North Canteen'],
    ['MBA Canteen'],
    ['Lake View'],
    ['Nandini'],
    ['Mingo\'s'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 60,
        ),
        //appbar
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Container(
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  //border: Border.all(color: AppColors.mainaccent),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200]),
              child: Icon(
                Icons.menu_rounded,
                color: AppColors.mainaccent,
              )),
        ),

        SizedBox(height: 20),

        //choose a canteen

        //search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                //border: Border.all(color: AppColors.mainaccent),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 30,
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What are you craving...?'),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 1,
        ),

        //Good Morning Card
        Container(
          height: 180,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                //border: Border.all(color: AppColors.mainaccent),
                borderRadius: BorderRadius.circular(12),
                // implement shadow effect
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(5, 10),
                      spreadRadius: 0.05,
                      blurStyle: BlurStyle.normal),
                ],
              ),
              child: MorningCard(
                  greeting: 'Good Day', userName: 'Rohan', greetImage: '#'),
            ),
          ),
        ),

        //cantten grid
        Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Select one',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 26),
            )),

        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: ScrollConfiguration(
              behavior: CustomScroll(),
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1),
                itemCount: canteen_cards.length,
                itemBuilder: ((context, index) {
                  return CanteenCard(
                    canteenName: canteen_cards[index][0],
                  );
                }),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

