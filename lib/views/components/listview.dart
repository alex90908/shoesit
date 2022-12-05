import 'package:flutter/material.dart';
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

class Sepatu extends StatefulWidget {
  const Sepatu({super.key});

  @override
  State<Sepatu> createState() => _SepatuState();
}

class _SepatuState extends State<Sepatu> {
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat Pemesanan'),
        ),
        body: ListView.builder(
          itemCount: articles==null?0:articles.length,
          itemBuilder: (_,i) {
            return Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          "http://192.168.81.201:8000/uploads/"+articles[i].gambar,
                          fit: BoxFit.cover,
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                    title: Text(articles[i].alamat),
                    subtitle: Text(articles[i].nama),
                    trailing: Text(articles[i].harga.toString()),
                    onTap: () {},
                  ),
                ));
          },

        ));
  }
}
