import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matabunda/login/controller_login.dart';
import 'package:matabunda/login/view_login.dart';
import 'package:matabunda/register/view_register.dart';
import 'package:matabunda/reset/controller_reset.dart';
// ignore: depend_on_referenced_packages
// import 'package:flutter_svg/flutter_svg.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  late String? email, password;

  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Reset'),
        toolbarHeight: 65,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 192, 0, 29),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formState,
                child: Column(children: [
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 10,
                        child: Image.asset(
                          "assets/images/zoo.png",
                          height: 220,
                          width: 370,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 241, 243),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              // controller: textControllerEmail,
                              validator: ((value) {
                                if (value == '') {
                                  return "Isi terlebih dahulu!";
                                }
                              }),
                              decoration: InputDecoration(
                                icon: new Icon(Icons.mark_email_read),
                                border: InputBorder.none,
                                hintText: 'Email..',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () async {
                      if (_formState.currentState!.validate()) {
                        print("email : " + email!);
                        await Reset_pw.send_reset(email, context);
                      } else {
                        print("Validation Error");
                      }
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
                            "Kirim Link Reset",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 192, 0, 29),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  // SizedBox(height: 20),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SizedBox(height: 20),
                  //     Text(
                  //       'Jika belum punya akun?',
                  //       style: TextStyle(fontSize: 15, color: Colors.black54),
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //       height: 5,
                  //     ),
                  //     GestureDetector(
                  //       child: Text(
                  //         'Klik Register',
                  //         style: TextStyle(
                  //             color: Color.fromARGB(255, 192, 0, 29),
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 15),
                  //       ),
                  //       onTap: () {
                  //         Navigator.of(context).pushReplacement(
                  //             MaterialPageRoute(
                  //                 builder: (context) => RegisterView()));
                  //       },
                  //     ),
                  //   ],
                  // ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
