import 'package:flutter/material.dart';
import 'package:two_dos/presentation/screens/splash_screen/widgets/developer_sign.dart';
import 'package:two_dos/presentation/screens/splash_screen/widgets/splash_screen_title.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),
        () => Navigator.pushReplacementNamed(context, 'home'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SplashScreenTitle(),
          DeveloperSign(),
        ],
      ),
    );
  }
}
