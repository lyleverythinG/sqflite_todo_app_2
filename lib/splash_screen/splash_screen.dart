import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sqflite_practice/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SqFliteDemo())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: LottieBuilder.network(
            'https://assets5.lottiefiles.com/packages/lf20_p9e3k0ln.json',
            repeat: false,
            animate: true,
          ),
        ),
      ),
    );
  }
}
