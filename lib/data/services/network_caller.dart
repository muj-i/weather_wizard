import 'dart:developer';

import 'package:http/http.dart';

import 'network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url, {bool isLogin = false}) async {
    try {
      Response response = await get(Uri.parse(url));

      log('heloooooo${response.statusCode}');

      //log(response.body);

      if (response.statusCode == 200) {
        log('Success');
        return NetworkResponse(true, response.statusCode, response.body);
      } else if (response.statusCode == 401) {
      } else {
        log('fail');
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }
}
