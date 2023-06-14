import 'package:flutter/material.dart';
import 'package:matabunda/dasbor/history_user/view_user.dart';
import 'package:matabunda/live/live.dart';
import 'package:matabunda/profil/profil.dart';
import 'package:matabunda/settings/settings.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Kembali ke menu Flutter sebelumnya
        Navigator.pop(context);
        return false; // Tidak memblokir fungsi back secara default
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Halaman Dashboard'),
          toolbarHeight: 65,
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 192, 0, 29),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          children: [
            DashboardMenuItem(
              icon: Icons.camera,
              title: 'Camera',
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => CameraScreen()));
                print('Camera tapped');
              },
            ),
            DashboardMenuItem(
              icon: Icons.table_chart,
              title: 'History User',
              onTap: () {
                // Handle calendar menu item tap
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => DataUserBaru()));
                print('Calendar tapped');
              },
            ),
            DashboardMenuItem(
              icon: Icons.table_chart,
              title: 'History Benda Tajam',
              onTap: () {
                // Handle calendar menu item tap
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => DataUserBaru()));
                print('Calendar tapped');
              },
            ),
            DashboardMenuItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SettingPage()));
                print('Settings tapped');
              },
            ),
            DashboardMenuItem(
              icon: Icons.person,
              title: 'Profile',
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
                print('Profile tapped');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DashboardMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
