import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper{
  final url;
  NetworkHelper({@required this.url});

  Future<dynamic> getData()async{

      http.Response response = await http.get(url);


    if(response.statusCode==200){
      var data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }else{
      print(response.statusCode);
    }
  }


}