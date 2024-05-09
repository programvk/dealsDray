import 'dart:convert';

import 'package:http/http.dart' as http;

class APIRequest {
  Future<http.Response> postRequest(
      String url, Map<String, dynamic> data) async {
    var body = jsonEncode(data);
    http.Response response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
    }

    return response;
  }

  Future<http.Response> getRequest() async {
    http.Response response = await http.get(Uri.parse(
        'http://devapiv3.dealsdray.com/api/v2/user/home/withoutPrice'));

    return response;
  }
}
