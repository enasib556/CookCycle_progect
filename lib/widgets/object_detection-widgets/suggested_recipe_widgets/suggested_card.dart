import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../screens/detailsOfSuggested_screen.dart';

class SuggestedCard extends StatelessWidget {
  final int index;
  const SuggestedCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isOdd = index.isOdd;
    return SizedBox(
      width: 383,
      height: 195,
      child: GestureDetector(
        onTap:() {Navigator.push(context,MaterialPageRoute(builder: (context)=> DetailsOfSuggestedScreen()));},
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                textDirection:
                isOdd ? TextDirection.rtl : TextDirection.ltr,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset('assets/images/salmon-salad-international.png')),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Apple \n& Walnut Salad',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff6E7370),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 17,),
                      Text('4/6 ingredent\nAvaliable',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6E7370).withOpacity(0.69),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
