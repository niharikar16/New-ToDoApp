import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/first_page.dart';
import 'forget_page.dart';

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
      backgroundColor: Color(0xffe3d7bd),
      appBar: AppBar(
        //-------------------------back button---------------------------
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10),
          child: BackButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstPage()));
            },
            color: Colors.black,

          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xffe3d7bd),
      ),

      //-----------------------------body--------------------------------------
      body: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //----------------------account icon-----------------------
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 50),
                child: Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.black,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              //--------------------Hello text-----------------------------
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  'Hello, Welcome!',
                  style: GoogleFonts.montserrat(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 30),
                child: Text(
                  "Sign in to continue...",
                  style: GoogleFonts.montserrat(
                      fontSize: 25,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),

              //----------------------Design container--------------------------
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff171717),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),topRight: Radius.circular(60)
                          ),),

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
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Email',
                            fillColor: Color(0xffe3d7bd),
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
                                borderSide: BorderSide(color: Color(0xffe3d7bd)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffe3d7bd)),
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: 'Password',
                              fillColor: Color(0xffe3d7bd),
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
                              padding: const EdgeInsets.only(right: 60.0),
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xffe3d7bd)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Center(
                        child: InkWell(

                          // onTap: openLoginPage,//
                          child: Container(

                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                            decoration: BoxDecoration(color: Colors.black, boxShadow: [
                              BoxShadow(
                                  color: Color(0xffe3d7bd).withOpacity(0.4),
                                  offset: Offset(0, 0),
                                  blurRadius: 30,
                                  spreadRadius: 9),
                            ], borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text(
                              "Login",
                              style: GoogleFonts.montserrat(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffe3d7bd)),
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
        context, MaterialPageRoute(builder: (context) => ForgetPage()));
  }
}
