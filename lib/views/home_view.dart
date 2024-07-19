import 'package:auth/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/login_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                context.go(login_page);// Use the signOut method from your view model
              },
              child: Text('Logout'),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero, // Remove padding
                backgroundColor: Colors.transparent, // Text color
              ),
            ),
          ],
        ));
  }
}
