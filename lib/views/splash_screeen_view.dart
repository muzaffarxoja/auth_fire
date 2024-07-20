import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delayed navigation
    Future.delayed(const Duration(seconds: 5), () {
      context.go(login_page); // Ensure you have the correct route name
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 180),
            Text(
              'Lorby',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Color(0xff212121),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'you personal tutor',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff212121),
              ),
            ),
            SizedBox(height: 65),
            Image(
              height: 350,
              width: double.maxFinite,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/splash_image.png'),
            ),
          ],
        ),
      ),
    );
  }
}
