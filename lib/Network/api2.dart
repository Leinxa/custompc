import 'package:http/http.dart' as http;
import 'package:market/model/rakitan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "dart:convert";

class apiNetwork{
  final String _url = 'http://10.0.2.2:8000/api';
  var token;

  _getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')?? '');
  }

  Future<Rakitan> fetchRakitan() async{
    await _getToken();
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/list/rakitan'),headers: _setHeaders());
      if (response.statusCode ==200) {
        return Rakitan.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to load');
      }
    }

    _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}