import 'dart:convert';

import 'package:dio/dio.dart';

final baseUrl = 'https://api-uni.herokuapp.com';
final Dio dio = new Dio();

class Authenticate {
  Future signIn(Map data) async {
    var response = await dio.post('$baseUrl/signIn', data: data);
    // var result = json.decode(response);
    return response.data;
  }
}
