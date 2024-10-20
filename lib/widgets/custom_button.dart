import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.fontSize,
    this.onTap,
  });

  final String text;
  final double height;
  final double width;
  final double fontSize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.balooBhaijaan2(
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
