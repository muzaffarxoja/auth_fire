import 'package:flutter/material.dart';

class CustomSplashScreen extends StatelessWidget {

  final String text1;
  final String text2;
  final double text1Size;

  CustomSplashScreen({required this.text1, required this.text1Size, required this.text2});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 180),
            Text(
              text1,
              style: TextStyle(
                fontSize: text1Size,
                fontWeight: FontWeight.w500,
                color: Color(0xff212121),
              ),
            ),
            SizedBox(height: 8),
            Text(
              text2,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff212121),
              ),
            ),
            SizedBox(height: 65),
            Container(
              height: 350,
              width: double.maxFinite,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/splash_image.png'),
              ),
            )

          ],
        ),
      );

  }
}
