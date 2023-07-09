// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/Business/end_points.dart';

class HttpHelper {
  static Map<String, String> _setHeaders() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'lang': 'en'
      };

// Todo :-  Get Data
  static Future<http.Response> getData({
    required String query,
    dynamic token,
  }) async {
    var headers = _setHeaders();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return await http.get(
      Uri.parse(EndPoints.baseUrL + query),
      headers: headers,
    );
  }

// Todo :- Post Data
  static Future<http.Response> postData({
    required String query,
    String? token,
    Map<String, dynamic>? data,
  }) async {
    var headers = _setHeaders();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return await http.post(
      Uri.parse(EndPoints.baseUrL + query),
      body: jsonEncode(data),
      headers: headers,
    );
  }

  // Todo :- Put Data
  static Future<http.Response> putData({
    required String query,
    Map<String, dynamic>? data,
    dynamic token,
  }) async {
    var headers = _setHeaders();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return await http.put(
      Uri.parse(EndPoints.baseUrL + query),
      body: jsonEncode(data),
      headers: headers,
    );
  }

  // Todo :- Remove Data
  static Future<http.Response> removeData({
    required String query,
    Map<String, dynamic>? data,
    dynamic token,
  }) async {
    var headers = _setHeaders();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return await http.delete(
      Uri.parse(EndPoints.baseUrL + query),
      body: jsonEncode(data),
      headers: headers,
    );
  }
}
