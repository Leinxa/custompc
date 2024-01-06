import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:market/model/casing.dart';
import 'package:market/model/cooler.dart';
import 'package:market/model/cpu.dart';
import 'package:market/model/motherboard.dart';
import 'package:market/model/psu.dart';
import 'package:market/model/ram.dart';
import 'package:market/model/storage.dart';
import 'package:market/model/vga.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network{
  final String _url = 'http://10.0.2.2:8000/api';
  var token;

  _getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')?? '');
  }


  auth(data, apiURL) async{
    var fullUrl = _url + apiURL;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders()
    );
  }
    edit(data, apiURL) async{
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.put(
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

    Future<Cpu> fetchCpu() async{
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/list/cpu'));
      if (response.statusCode ==200) {
        return Cpu.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to load');
      }
    }
        Future<Ram> fetchRam() async{
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/list/ram'));
      if (response.statusCode ==200) {
        return Ram.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to load');
      }
    }

       Future<Casing> fetchCasing() async{
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/list/casing'));
      if (response.statusCode ==200) {
        return Casing.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to load');
      }
    }

       Future<Psu> fetchPsu() async{
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/list/psu'));
      if (response.statusCode ==200) {
        return Psu.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to load');
      }
    }

       Future<Motherboard> fetchMotherboard() async{
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/list/motherboard'));
      if (response.statusCode ==200) {
        return Motherboard.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to load');
      }
    }

       Future<Vga> fetchVga() async{
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/list/vga'));
      if (response.statusCode ==200) {
        return Vga.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to load');
      }
    }
       Future<Cooler> fetchCooler() async{
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/list/cooler'));
      if (response.statusCode ==200) {
        return Cooler.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to load');
      }
    }

    Future<Storage> fetchStorage() async{
      final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/list/storage'));
      if (response.statusCode ==200) {
        return Storage.fromJson(jsonDecode(response.body));
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