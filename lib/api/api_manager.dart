import 'dart:convert';

import 'package:demo_news/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:demo_news/model/news_model.dart';


class ApiManager  {
  Future <List<DemoNewsModel>?> getNews() async {
    var client =  http.Client();
    var  _news_model = null;
    try{
      var response = await client.get(Uri.parse(Strings.api));
      if(response.statusCode == 200){
        //List<DemoNewsModel> _model = demoNewsModelFromJson(response.body);
        var jsonString = response.body;
        //var jsonMap = json.decode(jsonString);
        List<DemoNewsModel> _news_model = demoNewsModelFromJson(jsonString);
        // print(jsonMap);
        return _news_model;
      }
    }
    catch(e){
      print(e.toString());
    }

  }

}