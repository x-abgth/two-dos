import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:two_dos/presentation/screens/splash_screen/widgets/title_underline_animation.dart';

class SplashScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: FlareActor(
                    'assets/flare/circle_check.flr',
                    animation: 'Untitled',
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "TWO DO'S",
                  style: GoogleFonts.dancingScript(
                    color: Theme.of(context).backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TitleUnderlineAnimation(),
          ],
        ),
      ),
    );
  }
}
