import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Line(),
        Text(
          'Or With',
          style: GoogleFonts.manrope(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Line(),
      ],
    );
  }
}

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      width: MediaQuery.of(context).size.width * 0.25,
      height: 1,
    );
  }
}
