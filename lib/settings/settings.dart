import 'package:flutter/material.dart';
import 'package:matabunda/dasbor/dasbor.dart';
import 'package:matabunda/login/view_login.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Settings'),
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
            Text(
              'Pengaturan Umum',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Notifikasi'),
              subtitle: Text('Mengaktifkan notifikasi'),
              trailing: Switch(
                value: true,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              title: Text('Tema Gelap'),
              subtitle: Text('Aktifkan mode tema gelap'),
              trailing: Switch(
                value: false,
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pengaturan Akun',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Ubah Kata Sandi'),
              onTap: () {
                // Navigasi ke halaman ubah kata sandi
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
