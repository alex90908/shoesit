import 'package:flutter/material.dart';
import 'package:sewain_aku/utils/colors.dart';
import 'package:sewain_aku/views/components/form.dart';

final priceTextStyle = TextStyle(
  color: Colors.grey.shade600,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

class FoodCheckoutOnePage extends StatelessWidget {

  const FoodCheckoutOnePage({ Key? key }) : super(key: key);
  static final String path = "lib/src/pages/food/food_checkout.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        automaticallyImplyLeading: false,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: 80,
            child: Ink(
              decoration: BoxDecoration(
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.fromLTRB(
              16.0,
              kToolbarHeight + 40.0,
              16.0,
              16.0,
            ),
            children: [
              Text(
                "Pesanan Mu",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              OrderListItem(
                item: OrderItem(
                  title: "Laundry Kalo",
                  qty: "Jl Kali Danau",
                  price: 12.000,
                  bgColor: Colors.deepOrange,
                  image: "assets/bmw_6_series/1.jpg",
                ),
              ),
              const SizedBox(height: 20.0),
              OrderListItem(
                item: OrderItem(
                    title: "Laundry Kali",
                    qty: "Jl Kali Rawu",
                    price: 15.000,
                    bgColor: Colors.deepOrange,
                    image: "assets/honda/2.png"),
              ),
              const SizedBox(height: 20.0),
              OrderListItem(
                item: OrderItem(
                    title: "Laundry Kuli",
                    qty: "Jl Rawasari",
                    price: 15.000,
                    bgColor: Colors.deepOrange,
                    image: "assets/honda/2.png"),
              ),
              const SizedBox(height: 20.0),
              _buildDivider(),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const SizedBox(width: 40.0),
                  Text(
                    "Ongkir",
                    style: priceTextStyle,
                  ),
                  Spacer(),
                  Text(
                    "\$2000",
                    style: priceTextStyle,
                  ),
                  const SizedBox(width: 20.0),
                ],
              ),
              const SizedBox(height: 20.0),
              _buildDivider(),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const SizedBox(width: 40.0),
                  Text(
                    "Total",
                    style: priceTextStyle.copyWith(color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    "\$44000",
                    style: priceTextStyle.copyWith(color: Colors.indigo),
                  ),
                  const SizedBox(width: 20.0),
                ],
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>FormApp()),
                    );

                  },
                  child: Text('CheckOut'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),

                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }

  Container _buildDivider() {
    return Container(
      height: 2.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

class OrderItem {
  final String? title;
  final String? qty;
  final double? price;
  final String? image;
  final Color? bgColor;
  OrderItem({this.title, this.qty, this.price, this.image, this.bgColor});
}

class OrderListItem extends StatelessWidget {
  final OrderItem? item;

  const OrderListItem({Key? key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: item!.bgColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: item!.image != null
                ? Image.asset(
              item!.image!,
              fit: BoxFit.cover,
            )
                : null,
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item!.title!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(

                  height: 40.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Text(
                        "${item!.qty}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Text(
            "\$${item!.price! * 1000}",
            style: priceTextStyle,
          ),
        ],
      ),
    );
  }
}