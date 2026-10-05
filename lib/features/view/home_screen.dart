import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
   Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar:AppBar(
        
        backgroundColor: Color(0xff1877F2),
        title: Text("News",style:TextStyle(
          fontSize:30,
          fontWeight:FontWeight.bold,
          color:Colors.white,
        ))
      ),
      body:ListView.separated(
        padding: EdgeInsets.symmetric(horizontal:15),
        itemBuilder: (context, index) => NewsItemWidgets(),
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemCount:10,
      )
       
    );
  }
}

class NewsItemWidgets extends StatelessWidget {
  const NewsItemWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.of(context).
        pushNamed(AppRoutes.details);
      },
      child: Container(
       padding: EdgeInsets.all(8),
       child: Column(
         crossAxisAlignment:CrossAxisAlignment.start,
         children: [
        CustomImageNews(height: 200),
       Text("Europe",style:TextStyle(
         fontSize:14,
         fontWeight:FontWeight.w400,
         color:Color(0xffB0B3B8),
       )
        ),
        SizedBox(height: 4),
         Text("RUssian Warship MosKva Sinks in Black sea",style:TextStyle(
         fontSize:18,
         fontWeight:FontWeight.w400,
         color:Color(0xffB0B3B8)
      
        ))
        
       ],)
            ),
    );
  }
}

class CustomImageNews extends StatelessWidget {
  const CustomImageNews({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
     borderRadius:BorderRadiusGeometry.circular(12),
      child:
      CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
          
           CircularProgressIndicator()],
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
         width:double.infinity,
         height:height,fit:.cover,
        
    
    
     
      ),
    );
    
     
       



  
    
  }
}
String image="https://www.ramstarab.com/wp-content/uploads/2020/06/%D8%B5%D9%88%D8%B1-%D9%82%D8%B7%D8%B7-%D9%83%D9%8A%D9%88%D8%AA.jpg";