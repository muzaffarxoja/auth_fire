import 'package:auth/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/sign_in_out_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${user.email}  welcome'),
              const SizedBox(height: 28),
              TextButton(
                onPressed: () async {
                  final viewModel = Provider.of<LoginViewModel>(context, listen: false);
                  await viewModel.signOut(context);

                },
                child: Text('Logout'),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // Remove padding
                  backgroundColor: Colors.transparent, // Text color
                ),
              ),
            ],
          )),
    );
  }
}
