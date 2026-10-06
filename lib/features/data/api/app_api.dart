import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/features/data/model/news_model.dart';



abstract class AppApi{
   static Future<ApiResult<NewsModel>> getNews ()async{
    try{
       //https://newsapi.org/v2/everything?q=bitcoin&apiKey=630baa6468604e208a1b6bad87041422
    var response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=bitcoin&apiKey=630baa6468604e208a1b6bad87041422'));
      var responseBody= response.body;
      var json=jsonDecode(responseBody);
     return Success(NewsModel.fromJson(json));
     
    }
    catch(e){
      return Error(e.toString());
    }

  }
}