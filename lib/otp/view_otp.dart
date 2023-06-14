import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matabunda/login/view_login.dart';
import 'package:matabunda/otp/controller_otp.dart';
// ignore: depend_on_referenced_packages
// import 'package:flutter_svg/flutter_svg.dart';

class ViewOTP extends StatefulWidget {
  const ViewOTP({super.key});

  @override
  State<ViewOTP> createState() => _ViewOTPState();
}

class _ViewOTPState extends State<ViewOTP> {
  late String? token;

  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman OTP'),
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
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formState,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
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
                    SizedBox(height: 80),
                    Text(
                      'Masukan Token',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
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
                                    token = value;
                                  });
                                },
                                validator: ((value) {
                                  if (value == '') {
                                    return "Isi token dahulu!";
                                  }
                                }),
                                decoration: InputDecoration(
                                  icon: new Icon(Icons.token),
                                  border: InputBorder.none,
                                  hintText: 'Token..',
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
                          print("token : " + token!);
                          await Controller_otp.flutter_token(token, context);
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
                            SizedBox(width: 120),
                            Text(
                              "Kirim Token",
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
