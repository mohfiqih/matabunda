import 'package:flutter/material.dart';
import 'package:matabunda/dasbor/dasbor.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        toolbarHeight: 65,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 192, 0, 29),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => DashboardApp()));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/zoo.png'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Informasi Profil',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Nama'),
              subtitle: Text('John Doe'),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('johndoe@example.com'),
            ),
            ListTile(
              title: Text('Nomor Telepon'),
              subtitle: Text('1234567890'),
            ),
            SizedBox(height: 20),
            Text(
              'Alamat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Jalan'),
              subtitle: Text('Jl. Contoh Alamat'),
            ),
            ListTile(
              title: Text('Kota'),
              subtitle: Text('Kota Contoh'),
            ),
            ListTile(
              title: Text('Provinsi'),
              subtitle: Text('Provinsi Contoh'),
            ),
          ],
        ),
      ),
    );
  }
}
