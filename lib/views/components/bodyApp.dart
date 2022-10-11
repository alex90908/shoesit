import 'package:flutter/material.dart';
import 'package:sewain_aku/utils/colors.dart';
import 'package:sewain_aku/utils/sizes.dart';
import 'package:sewain_aku/views/components/hot_deals.dart';
import 'package:sewain_aku/views/components/title_with_view_all_btn.dart';
import 'package:sewain_aku/views/components/top_dealers.dart';
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
              HotDeals(),
              TitleWithViewAllBtn(title: "Jenis Sepatu", press: () {}),
              TopDealers(),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
