import 'package:flutter/material.dart';
import 'package:sewain_aku/utils/colors.dart';
import 'package:sewain_aku/utils/sizes.dart';

class TitleWithViewAllBtn extends StatelessWidget {
  const TitleWithViewAllBtn({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding / 4),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}