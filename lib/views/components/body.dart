import 'package:flutter/material.dart';
import 'package:sewain_aku/utils/colors.dart';
import 'package:sewain_aku/utils/sizes.dart';
import 'package:sewain_aku/views/components/hot_deals.dart';
import 'package:sewain_aku/views/components/title_with_view_all_btn.dart';
import 'package:sewain_aku/views/components/top_dealers.dart';
import 'header_with_search_box.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
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
