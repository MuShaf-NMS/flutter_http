import 'package:flutter/material.dart';
import 'package:project_1_9_2020/apiservices/apiservices.dart';
import 'package:project_1_9_2020/models/siswa.dart';
import 'package:project_1_9_2020/tambahsiswa.dart';

void main() {
  runApp(MaterialApp(
    home: new Project(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/awal': (BuildContext context) => Project(),
      '/tambah': (BuildContext context) => AddSiswa()
    },
  ));
}

class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  ApiServices apiServices;
  @override
  void initState() {
    super.initState();
    apiServices = ApiServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/tambah');
              })
        ],
        title: Text('halo'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: apiServices.getData(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Siswa>> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[
                    Tampil(
                        snapshot.data[0].id.toString(),
                        snapshot.data[0].nama,
                        snapshot.data[0].alamat,
                        snapshot.data[0].t_lahir,
                        snapshot.data[0].jl),
                    Tampil(
                        snapshot.data[1].id.toString(),
                        snapshot.data[1].nama,
                        snapshot.data[1].alamat,
                        snapshot.data[1].t_lahir,
                        snapshot.data[1].jl),
                    Tampil(
                        snapshot.data[2].id.toString(),
                        snapshot.data[2].nama,
                        snapshot.data[2].alamat,
                        snapshot.data[2].t_lahir,
                        snapshot.data[2].jl),
                    Tampil(
                        snapshot.data[3].id.toString(),
                        snapshot.data[3].nama,
                        snapshot.data[3].alamat,
                        snapshot.data[3].t_lahir,
                        snapshot.data[3].jl),
                    Tampil(
                        snapshot.data[4].id.toString(),
                        snapshot.data[4].nama,
                        snapshot.data[4].alamat,
                        snapshot.data[4].t_lahir,
                        snapshot.data[4].jl),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class Tampil extends StatelessWidget {
  String id, nama, alamat, t_lahir, jl;
  double size = 15;

  Tampil(this.id, this.nama, this.alamat, this.t_lahir, this.jl);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Id : ',
                  style: TextStyle(fontSize: size),
                ),
                Text(
                  id,
                  style: TextStyle(fontSize: size),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Nama : ',
                  style: TextStyle(fontSize: size),
                ),
                Text(
                  nama,
                  style: TextStyle(fontSize: size),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Alamat : ',
                  style: TextStyle(fontSize: size),
                ),
                Text(
                  alamat,
                  style: TextStyle(fontSize: size),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Tanggal lahir : ',
                  style: TextStyle(fontSize: size),
                ),
                Text(
                  t_lahir,
                  style: TextStyle(fontSize: size),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Jenis kelamin : ',
                  style: TextStyle(fontSize: size),
                ),
                Text(
                  jl,
                  style: TextStyle(fontSize: size),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
