import 'package:flutter/material.dart';
import 'package:sewain_aku/utils/colors.dart';
import 'package:sewain_aku/utils/sizes.dart';
import 'package:sewain_aku/views/components/homepage.dart';
import 'package:sewain_aku/views/components/title_with_view_all_btn.dart';
import 'package:sewain_aku/views/components/cek.dart';
import 'header_with_search_box.dart';

class BodyApp extends StatefulWidget {
  const BodyApp({Key? key}) : super(key: key);

  @override
  State<BodyApp> createState() => _BodyAppState();
}

class _BodyAppState extends State<BodyApp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              HeaderWithSearchBox(size: size),
              TitleWithViewAllBtn(title: "Jasa Cuci", press: () {}),
              SizedBox(height:15,),
              HomePage(),
              SizedBox(height:15,),
              TitleWithViewAllBtn(title: "Jenis Sepatu", press: () {}),
              Barang(),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
