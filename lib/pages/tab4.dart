
import 'dart:ui';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';

class tab4 extends StatefulWidget {

  @override
  State<tab4> createState() => _tab4State();
}

class _tab4State extends State<tab4> {
  List<int> counter = [0,0,0,0,0];
  List prices = ['₹ 20', '₹ 30', '₹ 40','₹ 20'];

  List pictures = ['https://farm8.staticflickr.com/7508/15591882863_12df5d1458_o.jpg','https://monkeyandmekitchenadventures.com/wp-content/uploads/2020/06/Vegan-Spicy-Chicken-Patty_08.jpg','https://www.chicken.ca/wp-content/uploads/2020/09/Moist-Chicken-Burgers.jpg','https://thehiddenveggies.com/wp-content/uploads/2021/01/vegan-chicken-patty-sq.jpg'];

  List Names = ['Veg\nBurger ', 'Spcial\nVeg\nBurger', 'Chicken\nBurger', 'Special\nChicken\nBurger'] ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of (context).size.height-10,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius : BorderRadius.all(Radius.circular(20)),
        color: Color(0xFFF5F5F5),
        
              ),
      

      child: ListView.builder(itemCount:4 ,
      shrinkWrap: false,
      itemBuilder: (BuildContext context, index) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),

        child: Container(
          child: SingleChildScrollView(
            child: Card(elevation: 5.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        
            child: Container(width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
        
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 55.0,
                        height: 55.0,
                
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                
                        child: Container(
                          width: 55.0,
                          height: 55.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Image.network(pictures[index])),
                          ),
                
                
                          
                
                      ),
                
                      
                
                      SizedBox(width: 17,),
                
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(Names[index], style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                
                          
                          ),
                
                          SizedBox(height: 10,),
                          
                          Container(
                            child: CounterButton(
                              loading: false,
                              onChange: (value) {
                                setState(() {
                                  counter[index] = value;
                                  });
                          
                          
                        },
                        count: counter[index],
                        countColor: Colors.purple,
                        buttonColor: Colors.purpleAccent,
                        progressColor: Colors.purpleAccent,
                        
                        )
                    )
                        ],
                      ),
        
        
                       Column(
                          children: [
                                    
                            Padding(
                              padding: const EdgeInsets.fromLTRB(35, 10, 10, 90),
                              child: Text(prices[index], style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
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