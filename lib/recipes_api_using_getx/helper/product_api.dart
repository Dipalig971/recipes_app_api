import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RecipesApi{
  static String api = 'https://dummyjson.com/recipes';

  Future<String?> apicalled() async {
    Uri uri = Uri.parse(api);
    Response response =await http.get(uri);

    if(response.statusCode==200){
      print('--------------------Api Called-------------');
      return response.body;
    }
    return null;
  }
}
