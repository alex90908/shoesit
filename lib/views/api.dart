import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class CallApi{
  final String _url="http://192.168.199.201:8000/api/";
  final String _imgUrl="http://192.168.81.201:8000/uploads/";
  getImage(){
    return _imgUrl;
  }postData(data,apiUrl) async {
    var fullUrl = _url+apiUrl+await _getToken();
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }
   getPublicData(apiUrl) async {
    http.Response response = await http.get(
      Uri.parse(_url+apiUrl)
    );
    try {
      if (response.statusCode == 200){
        return response;
      } else {
        return "failed";
      }
    } catch (e){
      print(e);
      return 'failed';
    }
   }
  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }


  _setHeaders()=>{
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}