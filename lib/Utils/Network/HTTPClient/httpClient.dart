import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:cat_breed_app/Utils/Network/Exceptions/apiException.dart';

class HttpClient {
  HttpClient._();

  static final HttpClient _instance = HttpClient._();

  factory HttpClient() {
    return _instance;
  }

  Future<dynamic> getRequest(String path, Map<String, String> headers) async {
    Response response;
    try {
      response = await get(path);
      final statusCode = response.statusCode;
      if (statusCode >= 200 && statusCode < 299) {
        if (response.body.isEmpty) {
          return List<dynamic>();
        } else {
          return jsonDecode(response.body);
        }
      } else if (statusCode >= 400 && statusCode < 500) {
        throw ClientErrorException();
      } else if (statusCode >= 500 && statusCode < 600) {
        throw ServerErrorException();
      } else {
        throw UnknownException();
      }
    } on SocketException {
      throw ConnectionException();
    }
  }
}