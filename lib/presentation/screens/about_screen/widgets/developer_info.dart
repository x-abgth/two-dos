import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Developernfo extends StatefulWidget {
  const Developernfo({Key? key}) : super(key: key);

  @override
  State<Developernfo> createState() => _DevelopernfoState();
}

class _DevelopernfoState extends State<Developernfo> {
  TapGestureRecognizer gitLinkRecognizer = TapGestureRecognizer();
  TapGestureRecognizer portfolioLinkRecognizer = TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "About the developer",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: SizerUtil.deviceType == DeviceType.tablet
                        ? 10.sp
                        : 18.sp,
                  ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Do support 👍",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: SizerUtil.deviceType == DeviceType.tablet
                      ? 7.5.sp
                      : 13.sp,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.justify,
            ),
          ),
          hperlinkText(
            normalText: 'Connect with me - ',
            webLink: 'https://abgth-dev.web.app/',
            linkName: 'abgth-dev.web.app',
            recognizer: portfolioLinkRecognizer,
          ),
          hperlinkText(
            normalText: 'github profile - ',
            webLink: 'https://github.com/x-abgth',
            linkName: 'x-abgth',
            recognizer: gitLinkRecognizer,
          ),
        ],
      ),
    );
  }

  Widget hperlinkText({
    required String normalText,
    required String linkName,
    required String webLink,
    required TapGestureRecognizer recognizer,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: normalText,
          style: TextStyle(
            color: Colors.black,
            fontSize:
                SizerUtil.deviceType == DeviceType.tablet ? 7.5.sp : 13.sp,
          ),
        ),
        TextSpan(
            text: linkName,
            style: TextStyle(
              fontSize:
                  SizerUtil.deviceType == DeviceType.tablet ? 7.5.sp : 13.sp,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: recognizer
              ..onTap = () {
                launch(webLink);
              }),
      ])),
    );
  }

  @override
  void dispose() {
    gitLinkRecognizer.dispose();
    portfolioLinkRecognizer.dispose();
    super.dispose();
  }
}
