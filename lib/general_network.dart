import 'package:http/http.dart' as http;
import 'dart:convert';

class Request {
  Future<void> getToken() async {
    var params = {"name": "", "password": "", "device_name": ""};

    var response = await http.post(Uri.parse('https://beon.fun/api/v1/token'),
        body: params);

    print('Response body: ${response.body}');

    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var token = Uri.parse(decodedResponse['token'] as String);

    print(await token);
  }
}
