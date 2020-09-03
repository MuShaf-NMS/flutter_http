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
}
