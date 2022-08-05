
import 'dart:ui';
import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';

class tab2 extends StatefulWidget {

  @override
  State<tab2> createState() => _tab2State();
}

class _tab2State extends State<tab2> {
  List<int> counter = [0,0,0,0,0];
  List prices = ['₹ 20', '₹ 40', '₹ 30','₹ 40'];

  List pictures = ['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_OKk7_q2-yDXRSgOOTXAHwwDLVg492MirQA&usqp=CAU','https://2.bp.blogspot.com/-klyr2pWcIQg/WZT1ngEk5UI/AAAAAAAAYz0/7jil4SC8_YQs3fD_bIYL1zNCoHJt2RwQACLcBGAs/s1600/Street%2BStyle%2BMaggie%2BNoodles_finalforweb1.jpg','https://imgmedia.lbb.in/media/2019/07/5d25dbabffe87a20b8210b08_1562762155786.jpg','https://imgmedia.lbb.in/media/2019/07/5d25dbabffe87a20b8210b08_1562762155786.jpg'];

  List Names = ['Maggi\nNoodles ', 'Double\nMaggi', 'Masala\nMaggi', 'Double Masala\nMaggi'] ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius : BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        
              ),
      

      child: ListView.builder(itemCount:4 ,
      shrinkWrap: false,
      itemBuilder: (BuildContext context, index) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),

        child: Container(
          height: 150,
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
      )),
      );
  }
}