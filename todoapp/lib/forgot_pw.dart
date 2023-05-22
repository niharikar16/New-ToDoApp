import 'package:flutter/material.dart';
import 'login_page.dart';


class ForgotPage extends StatelessWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Forgot(),
    );
  }
}

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ima,
      appBar: AppBar(
        //-------------------------back button---------------------------
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10),
          child: BackButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Add other widgets here
          ],
        ),
      ),
    );
  }
}
