import 'package:flutter/material.dart';

class AddSiswa extends StatefulWidget {
  @override
  _AddSiswaState createState() => _AddSiswaState();
}

class _AddSiswaState extends State<AddSiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Siswa'),
      ),
      body: Card(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tanggal lahir'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Jenis kelamin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
