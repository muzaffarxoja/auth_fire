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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Welcome')),
    );
  }
}
