import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

abstract class RequestHandler {
  static Future handleResponse(Response response) async {
    // debugPrint(response.statusCode.toString());
    // debugPrint(response.body);
    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse;

      default:
        throw 'Não foi possível completar requisição';
    }
  }
}
