import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget widget;

  const InputField(
      {Key? key,
      required this.title,
      required this.hint,
      required this.controller,
      required this.widget})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text(title, style: GoogleFonts.fredoka(fontSize: 20,),)],
      ),
    );
  }
}
