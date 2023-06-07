import 'package:flutter/material.dart';
import 'package:matabunda/ip/ip.dart';
import 'package:matabunda/login/view_login.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ExploreScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mata Bunda'),
        toolbarHeight: 65,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
                size: 30,
              ),
              label: 'Dashboard',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.table_rows,
              color: Colors.black,
              size: 30,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
              color: Colors.black,
              size: 30,
            ),
            label: 'Grafik',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
        selectedLabelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Dashboard',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// -------------------- History User ------------------ //
class ExploreScreen extends StatelessWidget {
  late InAppWebViewController webviewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(ip + 'history-users'),
        ),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
        ),
        onWebViewCreated: (controller) {
          webviewController = controller;
        },
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorites Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// ------------------------------- Halaman Profil ----------------------------- //
// ------------------------------- Halaman Profil ----------------------------- //
// ------------------------------- Halaman Profil ----------------------------- //
class ProfileScreen extends StatelessWidget {
  final _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    "https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2019/12/12/60017812.jpg"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Moh. Fiqih Erinsyah",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "mohfiqiherinsyah@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // ------------------------- SHOW EDIT PASSWORD ------------------------ //
              InkWell(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('Edit Password'),
                          content: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Form(
                              key: _formState,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Container(
                                      child: Text(
                                        "Jika ingin mengubah password, masukan email yang sekarang anda gunakan dan ubah password yang ingin diubah.",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      alignment: Alignment.centerLeft,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: false,
                                              onChanged: (value) {
                                                // setState(() {
                                                //   email = value;
                                                // });
                                              },
                                              // controller:
                                              //     textControllerChangeEmail,
                                              validator: ((value) {
                                                if (value == '') {
                                                  return "Mohon isi terlebih dahulu!";
                                                }
                                              }),
                                              decoration: InputDecoration(
                                                icon: new Icon(Icons.email),
                                                border: InputBorder.none,
                                                hintText: 'Masukan Email',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: true,
                                              onChanged: (value) {
                                                // setState(() {
                                                //   email = value;
                                                // });
                                              },
                                              validator: ((value) {
                                                if (value == '') {
                                                  return "Mohon isi terlebih dahulu!";
                                                }
                                              }),
                                              decoration: InputDecoration(
                                                icon: new Icon(Icons.password),
                                                border: InputBorder.none,
                                                hintText: 'New Passoword',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  InkWell(
                                    onTap: () async {},
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(width: 30),
                                          Text(
                                            "Update Password",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                          SizedBox(width: 70),
                                          Icon(
                                            Icons.update,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ],
                                      ),
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [],
                        );
                      });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 100),
                      Text(
                        "Edit Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      SizedBox(width: 50),
                      Icon(
                        Icons.edit_note,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 130),
                          Text(
                            "Logout",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          SizedBox(width: 85),
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 25,
                          ),
                        ],
                      ),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              ]),

              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
