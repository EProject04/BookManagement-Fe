
import 'package:frame/app/data/services/request_api.dart';
import 'package:http/http.dart' as http;

class NetWorkHandler {
  static final client = http.Client();
  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint),
        body: body, headers: {
      "content-type": "application/json"
    });
    return response.body;
  }
  static Future<String> get(String endpoint) async {
    var response = await client.get(buildUrl(endpoint),
       headers: {
         "content-type": "application/json"
    });
    return response.body;
  }

  static Uri buildUrl(String endpoint) {
    String host = RequestApi.BaseUrl;
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }
}
