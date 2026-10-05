import 'package:flutter/material.dart';
import 'package:news_app/features/view/home_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar:AppBar(
        
        backgroundColor: Color(0xff1877F2),
        iconTheme:IconThemeData(color:Colors.white),
        title: Text(" Details news",style:TextStyle(
          fontSize:30,
          fontWeight:FontWeight.bold,
          color:Colors.white,
        ))
      ),
      body:SingleChildScrollView(
        padding:EdgeInsets.symmetric(horizontal:16),
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            SizedBox(height: 30),
            CustomImageNews(height:300,image:image),
             SizedBox(height: 30),
           
        
         Text("RUssian Warship MosKva Sinks in Black sea",style:TextStyle(
         fontSize:18,
         fontWeight:FontWeight.w400,
         color:Color(0xffB0B3B8)
      
        )),
         SizedBox(height: 15),
         Text("Europe",style:TextStyle(
         fontSize:14,
         fontWeight:FontWeight.w400,
         color:Color(0xffB0B3B8),
       )
        ),
        SizedBox(height: 10),
         Text("The smallest kitten of Russia's living-room fleet has sunk after an unexpected splash in the cereal bowl. Initial reports suggest it was startled by a sudden cucumber sighting, though witnesses claim it just slipped on wet tiles. This is a remarkably cute and dramatic operational blow.",
         style:TextStyle(
         fontSize:16,
         fontWeight:FontWeight.w400,
         color:Color(0xffB0B3B8)
      
        ))
        
        

          ],
        )
      ),
      
        
    );
  }
}