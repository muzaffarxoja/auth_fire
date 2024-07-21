import 'package:auth/main.dart';
import 'package:auth/widgets/splash_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/sign_in_out_viewmodel.dart';
import 'package:provider/provider.dart';

class NewSignupView extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSplashScreen(text1: 'Welcome', text1Size: 20, text2: 'Lorby-your personal tutor',),
          const SizedBox(height: 28),
          GestureDetector(
            onTap: () async {
              final viewModel = Provider.of<LoginViewModel>(context, listen: false);
              await viewModel.signOut(context);

            },
            child: Text('Logout'),

          ),
        ],
      ),
    );
  }
}
