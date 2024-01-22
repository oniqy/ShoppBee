import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_bee/main.dart';
import 'package:shop_bee/page/HomePage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController _textEmail = TextEditingController();
  TextEditingController _textPW = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Text(
                        "Mua sắm cả thế giới với",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.lightBlue,
                        ),
                        child: Center(
                          child: Text(
                            "ShopBee",
                            style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 350,
                    child: TextField(
                      controller: _textEmail,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    child: TextField(
                      controller: _textPW,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  checkLogin(_textEmail.text, _textPW.text, context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue, // background color
                  onPrimary: Colors.white, // text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30), // button padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // button border radius
                  ),
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void checkLogin(String email, String ps, BuildContext context) {
  if (email == "vyle" && ps == "312013") {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  } else {
    print("Thu lai di");
  }
}
