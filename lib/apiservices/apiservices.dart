import 'dart:convert';

import 'package:project_1_9_2020/models/siswa.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class ApiServices {
  static const url = 'https://api-v2.pondokdiya.id';
  Future<List<Siswa>> getData() async {
    final response = await http.get("$url/siswa");
    if (response.statusCode == 200) {
      return getAll(response.body);
    } else {
      throw Exception('Oops');
    }
  }

  Future<Siswa> getSiswa(int id) async {
    final response = await http.get('$url/siswa/$id');
    print(response.body);
    if (response.statusCode == 200) {
      return getOne(response.body);
    }
  }

  Future<String> postData(Siswa data) async {
    print(data);
    print(dataToJson(data));
    final response = await http.post('$url/add-siswa',
        headers: {"content-type": "application/json"}, body: dataToJson(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return 'Succes';
    } else {
      return 'Gagal';
    }
  }

  Future<String> putData(Siswa data, int id) async {
    print(data);
    print(dataToJson(data));
    final response = await http.put('$url/siswa/$id',
        headers: {"content-type": "application/json"}, body: dataToJson(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return 'Succes';
    } else {
      return 'Gagal';
    }
  }
}
