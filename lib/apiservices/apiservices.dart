import 'package:project_1_9_2020/models/siswa.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class ApiServices {
  static const url = 'https://api-v2.pondokdiya.id';
  Future<List<Siswa>> getData() async {
    final response = await http.get("$url/siswa");
    print(response.body);
    if (response.statusCode == 200) {
      return getAll(response.body);
    } else {
      throw Exception('Oops');
    }
  }

  Future<String> postData(Siswa data) async {
    print(data);
    print(data.toJson());
    final response = await http.post('$url/add-siswa', body: data.toJson());
    print(response.statusCode);
    if (response.statusCode == 200) {
      return 'Succes';
    } else {
      return 'Gagal';
    }
  }
}
