import 'package:flutter/material.dart';
import 'package:news_app/features/data/model/news_model.dart';
import 'package:news_app/features/view/home_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, });
 

  @override
  Widget build(BuildContext context) {
     var arg=ModalRoute.of(context)?.settings.arguments as Articles;
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
            CustomImageNews(height:300,image:arg.urlToImage ?? image,),
             SizedBox(height: 30),
           
        
         Text(arg.title ?? "",style:TextStyle(
         fontSize:18,
         fontWeight:FontWeight.w400,
         color:Color(0xffB0B3B8)
      
        )),
         SizedBox(height: 15),
         Text(arg.author ?? "",style:TextStyle(
         fontSize:14,
         fontWeight:FontWeight.w400,
         color:Color(0xffB0B3B8),
       )
        ),
        SizedBox(height: 10),
         Text(arg.description ?? "",style:TextStyle(
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