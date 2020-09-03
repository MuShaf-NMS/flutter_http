import 'dart:convert';

class Siswa {
  int id;
  String nama;
  String alamat;
  String t_lahir;
  String jl;

  Siswa({this.id, this.nama, this.alamat, this.t_lahir, this.jl});

  factory Siswa.fromJson(Map<String, dynamic> json) {
    return Siswa(
        id: json['id'],
        nama: json['nama'],
        alamat: json['alamat'],
        t_lahir: json['t_lahir'],
        jl: json['jl']);
  }
}

List<Siswa> getAll(String jsonData) {
  final data = json.decode(jsonData);
  return List<Siswa>.from(data.map((item) => Siswa.fromJson(item)));
}
