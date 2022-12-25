
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sewain_aku/views/kompon/text_widget.dart';
import 'package:sewain_aku/views/lara/getsepatu.dart';
import 'package:sewain_aku/views/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Barang extends StatefulWidget {
  const Barang({Key? key}) : super(key: key);

  @override
  State<Barang> createState() => _BarangState();
}

class _BarangState extends State<Barang> {
  var sepat= <SepatuInfo>[];
  var sepat2 = <SepatuInfo>[];
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
    await CallApi().getPublicData("history2").then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        sepat = list.map((model)=>SepatuInfo.fromJson(model)).toList();
      });
    });
    await CallApi().getPublicData("allarticles").then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        sepat2= list.map((model)=>SepatuInfo.fromJson(model)).toList();
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
        itemCount: sepat==null?0:sepat.length,
        itemBuilder: (_,i){
          return GestureDetector(
            onTap: (){
              debugPrint(i.toString());
            },
            child: sepat.length==0?CircularProgressIndicator():Stack(
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
                          image: NetworkImage("http://192.168.81.201:8000/uploads/"+sepat[i].gambar),
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
                          TextWidget(text: sepat[i].nama, fontSize: 20),
                          Divider(
                              color:Colors.black
                          ),
                          TextWidget(text: sepat[i].sepatu, fontSize: 16,
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
