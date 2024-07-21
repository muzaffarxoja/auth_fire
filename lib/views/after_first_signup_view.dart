import 'package:auth/main.dart';
import 'package:auth/widgets/custom_elevated_button.dart';
import 'package:auth/widgets/splash_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/sign_in_out_viewmodel.dart';
import 'package:provider/provider.dart';

class AfterFirstSignUp extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: AlertDialog(
            title: Text('Log out?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff212121),
              ),),
            content: Text('Are you shure?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff212121),
              ),),
            actions: [
              CustomElevatedButton(text: 'Yes', onPressed: () async {
                final viewModel = Provider.of<LoginViewModel>(context, listen: false);
                await viewModel.signOut(context);


              },),
              GestureDetector(
                onTap: ()=>context.pop(),
                child: Text('No, I will stay',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff212121),
                  ),),
              ),
            ],
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSplashScreen(text1: 'Welcome', text1Size: 20, text2: 'Lorby-your personal tutor',),
          const SizedBox(height: 50),

          GestureDetector(
            onTap: () =>_showInfoDialog(context),

            child: Text('Logout'),

          ),
        ],
      ),
    );
  }
}
