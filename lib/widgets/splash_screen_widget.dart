import 'package:flutter/material.dart';

class CustomSplashScreen extends StatelessWidget {
  final String text1;
  final String text2;
  final double text1Size;

  const CustomSplashScreen({
    super.key,
    required this.text1,
    required this.text1Size,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 180),
          Text(
            text1,
            style: TextStyle(
              fontSize: text1Size,
              fontWeight: FontWeight.w500,
              color: const Color(0xff212121),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text2,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xff212121),
            ),
          ),
          const SizedBox(height: 65),
          Image.asset(
            'assets/images/splash_image.png',
            height: 350,
            width: double.maxFinite,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
