import 'package:flutter/material.dart';
import 'package:project_1_9_2020/apiservices/apiservices.dart';
import 'package:project_1_9_2020/models/siswa.dart';

class EditSiswa extends StatefulWidget {
  @override
  _EditSiswaState createState() => _EditSiswaState();
}

class _EditSiswaState extends State<EditSiswa> {
  TextEditingController controllerNama;
  TextEditingController controllerAlamat;
  TextEditingController controllerT_lahir;
  TextEditingController controllerJl;
  String pesan = 'Kosong';
  void setSiswa(String nama, alamat, t_lahir, jl) {
    controllerNama = TextEditingController(text: nama);
    controllerAlamat = TextEditingController(text: alamat);
    controllerT_lahir = TextEditingController(text: t_lahir);
    controllerJl = TextEditingController(text: jl);
  }

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
          title: Text('Edit'),
        ),
        body: Card(
            child: Container(
                padding: EdgeInsets.all(15),
                child: Center(
                  child: FutureBuilder(
                      future: apiServices.getSiswa(1),
                      builder: (BuildContext context,
                          AsyncSnapshot<Siswa> snapshot) {
                        if (snapshot.hasData) {
                          setSiswa(snapshot.data.nama, snapshot.data.alamat,
                              snapshot.data.t_lahir, snapshot.data.jl);
                          return ListView(children: <Widget>[
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
                                  apiServices
                                      .putData(
                                          Siswa(
                                              nama: controllerNama.text,
                                              alamat: controllerAlamat.text,
                                              t_lahir: controllerT_lahir.text,
                                              jl: controllerJl.text),
                                          1)
                                      .then((value) => setState(() {
                                            pesan = value;
                                          }));
                                }),
                            Text(pesan)
                          ]);
                        }
                        return CircularProgressIndicator();
                      }),
                ))));
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
