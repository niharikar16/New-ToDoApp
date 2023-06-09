import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/first_page.dart';
import 'package:todoapp/main.dart';
import 'forgot_pw.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        //-------------------------back button---------------------------
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10),
          child: BackButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstPage()));
            },
            color: Color(0xff283048),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      //-----------------------------body--------------------------------------
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //----------------------account icon-----------------------
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
              ),
              child: Icon(
                Icons.account_circle,
                size: 150,
                color: Color(0xff283048),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //--------------------Hello text-----------------------------
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Hello, Welcome!',
                style: GoogleFonts.fredoka(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff283048)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 30),
              child: Text(
                "Sign in to continue...",
                style: GoogleFonts.fredoka(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            //----------------------Design container--------------------------
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        // offset: const Offset(0, 0),
                        // blurRadius: 15,
                        ),
                  ],
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(0),
                  //   topRight: Radius.circular(50),
                  // ),
                ),

                //------------------------password and email field ------------------
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 100, left: 60.0, right: 60, bottom: 30),
                      child: TextField(
                        // controller: _emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(40)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.blue)),
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 60.0, right: 60, bottom: 30),
                      child: TextField(
                        // controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(40)),
                            hintText: 'Password',
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    //----------------------------forget password------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: openForgetpwPage,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 80.0),
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.fredoka(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),

                    //--------------------------Login button-----------------------
                    Center(
                      child: InkWell(
                        onTap: openHomePage,//
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 70),
                          decoration: BoxDecoration(
                              color: Color(0xff283048),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(3, 3),
                                    blurRadius: 8,
                                    spreadRadius:-3),
                                BoxShadow(
                                    color: Colors.grey.shade100,
                                    offset: Offset(-2, -2),
                                    blurRadius: 10,
                                    spreadRadius: -7)
                              ],
                              borderRadius: BorderRadius.circular(60)),
                          child: Text(
                            "Login",
                            style: GoogleFonts.montserrat(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Image(image: AssetImage("assets/imageTwo.png"))
                  ],
                ),
              ),
            )
            // SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  //-----------------------navigation to forgetpassword page------------------------
  void openForgetpwPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPage()));
  }
  
  void openHomePage()
  {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => homePage()));
  }
}
