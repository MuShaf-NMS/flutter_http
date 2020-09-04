import 'package:flutter/material.dart';
import 'package:project_1_9_2020/apiservices/apiservices.dart';
import 'package:project_1_9_2020/models/siswa.dart';

class AddSiswa extends StatefulWidget {
  @override
  _AddSiswaState createState() => _AddSiswaState();
}

class _AddSiswaState extends State<AddSiswa> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();
  TextEditingController controllerT_lahir = TextEditingController();
  TextEditingController controllerJl = TextEditingController();
  String pesan = 'kosong';
  ApiServices apiServices;
  @override
  void initState() {
    apiServices = ApiServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Siswa'),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: <Widget>[
              FormSiswa(
                controller: controllerNama,
                label: 'Nama',
              ),
              FormSiswa(
                controller: controllerAlamat,
                label: 'Alamat',
              ),
              FormSiswa(
                controller: controllerT_lahir,
                label: 'Tanggal lahir',
              ),
              FormSiswa(
                controller: controllerJl,
                label: 'Jenis kelamin',
              ),
              IconButton(
                  icon: Icon(Icons.file_upload),
                  onPressed: () {
                    Siswa siswa = Siswa(
                        nama: controllerNama.text,
                        alamat: controllerAlamat.text,
                        t_lahir: controllerT_lahir.text,
                        jl: controllerJl.text);
                    apiServices.postData(siswa).then((value) => setState(() {
                          pesan = value;
                          Navigator.pop(context);
                        }));
                  }),
              Text(pesan)
            ],
          ),
        ),
      ),
    );
  }
}

class FormSiswa extends StatelessWidget {
  TextEditingController controller;
  String label;
  FormSiswa({this.controller, this.label});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }
}
