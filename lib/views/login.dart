import 'package:flutter/material.dart';
import 'package:sewain_aku/utils/colors.dart';
import 'package:sewain_aku/views/login.dart';
import 'package:sewain_aku/views/home_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sewain_aku/views/api.dart';


class SignDemo extends StatefulWidget {
  const SignDemo({ Key? key }) : super(key: key);
  @override
  _SignDemoState createState() => _SignDemoState();
}

class _SignDemoState extends State<SignDemo> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController nohpController = TextEditingController();

  _register() async {
    var data={
      'email':emailController.text,
      'password':passwordController.text,
      'nama':namaController.text,
      'nohp':nohpController.text,
    };

    var res = await CallApi().postData(data, 'register');
    var body = json.decode(res.body);
    if(body['success']){
      Navigator.push(
          context, 
          new MaterialPageRoute(builder: (context)=>Scaffold(
            appBar: AppBar(

            ),
            body: Container(
              color: Colors.white,
            ),
          )) );
    }
  }
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign UP"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/honda/2.png')),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
                    hintText: 'masukkan nama'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nohpController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'nohp',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: namaController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'nama',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password',
                    hintText: 'Enter secure password'),
              ),
            ),

            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: _register,
                child: Text(
                  'Daftar',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}


