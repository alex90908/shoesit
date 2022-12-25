import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:sewain_aku/views/api.dart';

class update extends StatefulWidget {
  const update({Key? key}) : super(key: key);

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  TextEditingController emailController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController nohpController = TextEditingController();

  _update() async {
    var data={
      'email':emailController.text,
      'nama':namaController.text,
      'nohp':nohpController.text,

    };

    var res = await CallApi().postData(data, 'update');
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
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
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
                    labelText: 'no',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: _update,
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
