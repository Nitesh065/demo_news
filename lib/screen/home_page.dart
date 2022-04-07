// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:demo_news/api/api_manager.dart';
import 'package:demo_news/model/news_model.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<DemoNewsModel>? _news_model = [] ;

  @override
  void initState() {
    _getData();
  }

  void _getData() async {
    _news_model = await ApiManager().getNews();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo News"),
      ),
      body: _news_model == null || _news_model!.isEmpty ?
          Center(
            child: CircularProgressIndicator(),
          ):
          ListView.builder(
              itemCount: _news_model!.length,
              itemBuilder: (context, index) {
              return Container(
                height: 100,
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child:AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(_news_model![index].images!.main.toString(),fit: BoxFit.cover,)),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text(_news_model![index].name!.first.toString(),overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                          SizedBox(
                            height: 8.0,
                          ),
                          Expanded(child: Text(_news_model![index].sayings.toString().replaceAll('[', ""),overflow: TextOverflow.ellipsis,maxLines: 2,))
                        ],
                      ),
                    )
                  ],
                ),
              );
          })
      );
  }
}
