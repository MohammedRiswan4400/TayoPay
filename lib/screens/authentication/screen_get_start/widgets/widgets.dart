import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/colors/colors.dart';

// Widgets of Screen Get Start
class CheckRatesButton extends StatelessWidget {
  const CheckRatesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kLightBlue,
      ),
      child: Center(
        child: Text(
          'Check Rates',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kDarkBlue,
            ),
          ),
        ),
      ),
    );
  }
}

class GetStartButton extends StatelessWidget {
  const GetStartButton({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kDarkBlue,
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kWhite,
            ),
          ),
        ),
      ),
    );
  }
}

class IhaveAccountButton extends StatelessWidget {
  const IhaveAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kLightBlue,
      ),
      child: Center(
        child: Text(
          'I have an account',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kDarkBlue,
            ),
          ),
        ),
      ),
    );
  }
}
