import 'dart:async';

import 'package:http/http.dart' as http;

class ApiService {
  String? token;

  Future<http.Response> postRequest({
    required String url,
    Map<String, String>? body,
    String? authToken,
  }) async {
    try {
      var response = await http
          .post(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
              if (authToken != null) 'Authorization': 'Bearer $authToken',
            },
            body: body == null
                ? null
                : body.entries.map((item) {
                    return '${Uri.encodeQueryComponent(item.key)}=${Uri.encodeQueryComponent(item.value)}';
                  }).join('&'),
          )
          .timeout(const Duration(seconds: 20));
      return response;
    } on TimeoutException {
      throw Exception('Request timeout. Please check your internet connection.');
    } on http.ClientException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
