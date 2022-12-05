import 'package:sewain_aku/utils/sizes.dart';
import 'dart:convert';
import 'package:sewain_aku/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sewain_aku/views/kompon/text_widget.dart';
import 'package:sewain_aku/views/lara/gethistory.dart';
import 'package:sewain_aku/views/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sewain_aku/views/components/k.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var articles = <HistoryInfo>[];
  var allarticles = <HistoryInfo>[];
  @override
  void initState() {
    _getData();
    super.initState();
  }
  _getData() async {
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
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height*0.27,
      child: PageView.builder(
        controller: PageController(viewportFraction: .9),
        itemCount: articles==null?0:articles.length,
        itemBuilder: (_,i){
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailApp()),
              );
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
                      ]
                    ),
                  ),
                )),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      height: 150,
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
                    left:180,
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
    );
  }
}
