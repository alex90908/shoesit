import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class CallApi{
  final String _url="http://192.168.231.201:8000/api/";
  postData(data,apiUrl) async {
    var fullUrl = _url+apiUrl+await _getToken();
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }
   getPublicData(apiUrl) async {
     var fullUrl = _url+apiUrl+await _getToken();
     return await http.post(
       Uri.parse(fullUrl),
       headers: _setHeaders(),
    );
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