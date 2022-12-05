
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sewain_aku/views/kompon/text_widget.dart';
import 'package:sewain_aku/views/lara/gethistory.dart';
import 'package:sewain_aku/views/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var articles = <HistoryInfo>[];
  var allarticles = <HistoryInfo>[];

  @override
  void initState() {
    _getArticles();
    super.initState();
  }

  _getArticles() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString("user");

/*
    if(user!=null){
    var userInfo=jsonDecode(user);
      debugPrint(userInfo);
    }else{
      debugPrint("no info");
    }*/
    await _initData();
  }
  _initData() async {
    await CallApi().getPublicData("history1").then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        articles= list.map((model)=>HistoryInfo.fromJson(model)).toList();
      });
    });
    await CallApi().getPublicData("allarticles").then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        allarticles= list.map((model)=>HistoryInfo.fromJson(model)).toList();
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    debugPrint(height.toString());
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Color(0xFFffffff),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu_book_sharp, color: Color(0xFF363f93)),
                Icon(Icons.menu, color: Color(0xFF363f93))
              ],
            ),
          ),
          SizedBox(height: height*0.02,),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                TextWidget(text:"Today",fontSize: 36),
                Expanded(child: Container()),
              ],
            ),
          ),
          SizedBox(height: height*0.02,),
          Container(
            padding: const EdgeInsets.only(left: 20,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: "Recommend", fontSize: 30,),
                Expanded(child: Container()),
                Row(
                  children: [
                    TextWidget(text: "view al", fontSize: 16, color: Color(0xFF363f93)),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color : Color(0xFF363f93)),
                      onPressed: (){},
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: height*0.27,
            child: PageView.builder(
              controller: PageController(viewportFraction: .9),
              itemCount: articles==null?0:articles.length,
              itemBuilder: (_,i){
                return GestureDetector(
                  onTap: (){
                    debugPrint(i.toString());
                  },
                  child: articles.length==0?CircularProgressIndicator():Stack(
                    children: [
                      Positioned(child: new Material(
                        elevation: 0.0,
                        child: new Container(
                          height: 180.0,
                          width: width*0.85,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0.0),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: new Offset(-10.0, 0.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0
                              )
                            ],
                          ),
                        ),
                      )),
                      Positioned(
                        top: 0,
                        left: 10,
                        child: Card(
                          elevation: 10.0,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage("http://192.168.81.201:8000/uploads/"+articles[i].gambar),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top:45,
                          left:width*0.4,
                          child: Container(
                            height: 200,
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: articles[i].alamat, fontSize: 20),
                                TextWidget(
                                    color: Colors.grey,
                                    text: articles[i].no_hp.toString()==null?"Dylan":articles[i].no_hp.toString(),
                                    fontSize: 16),
                                Divider(
                                  color:Colors.black
                                ),
                                TextWidget(text: articles[i].harga.toString(), fontSize: 16,
                                color: Colors.grey,),

                              ],
                            ),
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: "new book", fontSize: 30),
                Row(
                  children: [TextWidget(text: "view all", fontSize: 16),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color : Color(0xFF363f93)),
                      onPressed: (){},
                    )],
                )
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: Container(
              height: height*0.4,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: articles==null?0:articles.length,
                  itemBuilder: (_,i){
                    return GestureDetector(
                      onTap: (){
                      },
                      child: articles.length==0?CircularProgressIndicator():Container(
                        height: height*0.4,
                        width: 150,
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network("http://192.168.81.201:8000/uploads/"+articles[i].gambar,
                              fit: BoxFit.contain,),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),

                              ),
                              elevation: 5,
                            ),
                            TextWidget(text: articles[i].alamat, fontSize: 20),
                            TextWidget(text: articles[i].no_hp.toString()==null?"Dylan":articles[i].no_hp.toString(), fontSize: 20)
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ))
        ],
      ),
    );
  }
}
