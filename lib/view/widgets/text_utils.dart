import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String txet;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration underline;

  TextUtils({required this.fontSize,
    required this.fontWeight,
    required this.txet,
    required this.color,
    required this.underline,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txet,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          decoration: underline,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
