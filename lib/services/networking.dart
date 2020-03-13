import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkHelper {
  final String url;
  NetworkHelper({@required this.url});

  Future getData() async {
    Response resp = await get(url);
    if (resp.statusCode == 200) {
      String data = resp.body;
      var decoded = jsonDecode(data);
      return decoded;
    }
    return resp;
  }
}
