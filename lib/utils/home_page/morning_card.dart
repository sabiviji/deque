import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MorningCard extends StatelessWidget {
  final String greeting;
  final String userName;
  final String greetImage;

  MorningCard(
      {required this.greeting,
      required this.userName,
      required this.greetImage});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey[200],
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              greeting,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Text(userName,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
