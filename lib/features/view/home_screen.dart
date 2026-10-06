import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/data/api/app_api.dart';
import 'package:news_app/features/data/model/news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  List<Articles> articles = [];
  bool isLoading = true;
  String? error;
  
  void initState() {
    super.initState();
    getAllArticles();
  }
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
      body:isLoading ? Center(child: CircularProgressIndicator(),) : error != null ? Center(child: Text(error ?? "",style:TextStyle(
        fontSize:20,
     
        color:Colors.red,
      )),) :
      ListView.separated(
        padding: EdgeInsets.symmetric(horizontal:15),
        itemBuilder: (context, index) => NewsItemWidgets(article: articles[index],),
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemCount:articles.length,
      )
       
    );
  }
  void getAllArticles() async {
   isLoading = true;
    final news = await AppApi.getNews();
    
    setState(() {
      switch(news){
        case Success<NewsModel>():
        
          articles = news.data.articles ?? [];
          break;
        case Error<NewsModel>():
       
          error = news.errorMessage;
          break;
      }
      isLoading = false;
    });
  }
}

class NewsItemWidgets extends StatelessWidget {
  const NewsItemWidgets({
    super.key,required this.article,
  });
  final Articles article;

  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      onTap:(){
        Navigator.of(context).
        pushNamed(AppRoutes.details, arguments: article);
      },
      child: Container(
       padding: EdgeInsets.all(8),
       child: Column(
         crossAxisAlignment:CrossAxisAlignment.start,
         children: [
        CustomImageNews(height: 200, image: article.urlToImage),
       Text(article.author ?? "",style:TextStyle(
         fontSize:14,
         fontWeight:FontWeight.w400,
         color:Color(0xffB0B3B8),
       )
        ),
        SizedBox(height: 4),
         Text(article.title ?? "",style:TextStyle(
         fontSize:18,
         fontWeight:FontWeight.w400,
         color:Color(0xffB0B3B8),

      
        ),
        maxLines: 1,
        overflow:.ellipsis,
        ),
        
        
       ],)
            ),
    );
  }
}

class CustomImageNews extends StatelessWidget {
  const CustomImageNews({
    super.key,
    required this.height,
    required this.image,
    
  });

  final double height;
  final String? image;
  

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
     borderRadius:BorderRadiusGeometry.circular(12),
      child:
      CachedNetworkImage(
        imageUrl: image ?? "",
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