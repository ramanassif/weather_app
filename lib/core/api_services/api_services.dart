import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl;

  ApiServices({required this.baseUrl});

  Future getFromApi() async {
    Uri url = Uri.parse(baseUrl);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      throw Exception('error');
    }
  }
}
