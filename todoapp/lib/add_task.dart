import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/home_page.dart';
import 'buttons.dart';

class AddTask extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  AddTask(
      {Key? key,
      required this.controller,
      required this.onSave,
      required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent
            //color set to transperent or set your own color
            ));
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: BackButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homePage()));
                },
                color: Colors.black,
              ),
            ),
            elevation: 0,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: GoogleFonts.fredoka(fontSize: 30),
              )
            ],
          )),
        ));
  }
}
