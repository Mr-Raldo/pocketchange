// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:async';


import 'package:PocketChn/pages/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double? width;
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 6),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignIn(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          icon(),
          loader(),
        ],
      ),
    );
  }

  icon() {
    return Center(
      child: Container(
        width: 300.0,
        height: 300.0,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icon-1.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  loader() {
    return Positioned(
      bottom: 40.0,
      child: Container(
        width: width,
        alignment: Alignment.center,
        child: const SizedBox(
          height: 50.0,
          width: 50.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            strokeWidth: 2.0,
          ),
        ),
      ),
    );
  }
}
