import 'package:flutter/material.dart';
import 'package:project_1_9_2020/apiservices/apiservices.dart';
import 'package:project_1_9_2020/editsiswa.dart';
import 'package:project_1_9_2020/models/siswa.dart';
import 'package:project_1_9_2020/tambahsiswa.dart';

void main() {
  runApp(MaterialApp(
    home: new Project(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/awal': (BuildContext context) => Project(),
      '/tambah': (BuildContext context) => AddSiswa(),
      '/edit': (BuildContext context) => EditSiswa()
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
                return ListView.builder(
                  itemBuilder: (context, i) {
                    return Tampil(
                        snapshot.data[i].id.toString(),
                        snapshot.data[i].nama,
                        snapshot.data[i].alamat,
                        snapshot.data[i].t_lahir,
                        snapshot.data[i].jl);
                  },
                  itemCount: snapshot.data.length,
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
            ),
            RaisedButton(
                child: Text('Edit'),
                onPressed: () {
                  Navigator.pushNamed(context, '/edit');
                })
          ],
        ),
      ),
    );
  }
}
