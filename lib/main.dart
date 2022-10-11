import 'package:flutter/material.dart';
import 'package:sewain_aku/utils/colors.dart';
import 'package:sewain_aku/views/login.dart';
import 'package:sewain_aku/views/masuk.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}



