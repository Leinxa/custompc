import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network{
  final String _url = 'http://10.0.2.2:8000/api';
  // 192.168.1.2 is my IP, change with your IP address
  var token = "";

    _getToken() async{
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  String? storedValue = localStorage.getString('token');
  
  if(storedValue != null) {
    print('Stored Value: $storedValue');
    var jsonData = jsonDecode(storedValue);
    
    if(jsonData is Map && jsonData.containsKey('token')) {
      token = jsonData['token'];
    } else {
      print('Error: JSON does not contain token key');
    }
  } else {
    print('Error: No value found in local storage');
  }

  }

  auth(data, apiURL) async{
    var fullUrl = _url + apiURL;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders()
    );
  }

  getData(apiURL) async{
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}