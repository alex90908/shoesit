import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sewain_aku/utils/colors.dart';
import 'package:sewain_aku/utils/sizes.dart';
import 'package:sewain_aku/views/components/k.dart';

class HotDeals extends StatelessWidget {
  const HotDeals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          HotDealCard(
            image: "assets/bmw_6_series/1.jpg",
            title: "Laundry Epause",
            location: "Jl KM 10",
            price: 10000,
            press: () {
            },
          ),
          HotDealCard(
            image: "assets/bmw_6_series/1.jpg",
            title: "rrq",
            location: "JL km 6",
            price: 23800,
            press: () {
            },
          ),
          HotDealCard(
            image: "assets/bmw_6_series/1.jpg",
            title: "btr",
            location: "JL km 6",
            price: 42000,
            press: () {},
          ),
          HotDealCard(
            image: "assets/bmw_6_series/1.jpg",
            title: "aura",
            location: "JL km 6",
            price: 34000,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class HotDealCard extends StatelessWidget {
  const HotDealCard({
    Key? key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.press,
  }) : super(key: key);

  final String image, title, location;
  final int price;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double widthCard = size.width * 0.6;
    return Container(
      margin: EdgeInsets.only(
        left: defaultPadding,
        top: defaultPadding / 1.5,
        bottom: defaultPadding * 2.5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      width: widthCard,
      child: GestureDetector(
        onTap: press,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.only(left: defaultPadding, top: defaultPadding),
              child: Text("$title",
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: textColor),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.only(left: defaultPadding),
              child: Text(
                "$location",
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: primaryColor.withOpacity(0.5)),
              ),
            ),
            Image.asset(image,
              height: 200,
              width: 200,),
            Container(
              width: widthCard,
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.only(right: defaultPadding, bottom: defaultPadding/2),
              child: Text(
                'Rp $price',
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: primaryColor),
              ),
            ),
            SizedBox(
              width: widthCard,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailApp()),
                  );
                },
                child: Text('Pesan'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
