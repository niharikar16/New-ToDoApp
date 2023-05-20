// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'first_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// ------------HomePage-----------------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  //----------Splash Screen-------------------
  void initState() {
    Timer(Duration(seconds: 3), openOnBoard);
    super.initState();
  }

  @override
  //-----------design---------------------
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //     child: Text(
      //       "Todo App",
      //       style: GoogleFonts.josefinSans(color: Colors.white, fontSize: 30),
      //     ),
      //   ),
      //   backgroundColor: Colors.black,
      // ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 246, 250, 254),
            image: DecorationImage(
                image: AssetImage('assets/ToDoIcon.png'), fit: BoxFit.contain)),
      )),
    );
  }

//-----------new page navigation--------------------
  void openOnBoard() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FirstPage()));
  }
}
