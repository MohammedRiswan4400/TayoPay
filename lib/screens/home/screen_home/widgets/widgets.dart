import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidgetWithInterFont extends StatelessWidget {
  const TextWidgetWithInterFont({
    super.key,
    required this.title,
    required this.color,
    required this.size,
    required this.weight,
  });
  final String title;
  final Color color;
  final double size;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      overflow: TextOverflow.fade,
      maxLines: 1,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          fontSize: size,
          fontWeight: weight,
          color: color,
        ),
      ),
    );
  }
}
