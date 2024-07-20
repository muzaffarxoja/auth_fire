// verify_email_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/verify_email_viewmodel.dart';
import 'home_view.dart';


class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VerifyEmailViewModel(),
      child: Consumer<VerifyEmailViewModel>(
        builder: (context, viewModel, child) {
          return viewModel.isEmailVerified
              ? HomeView()
              : Scaffold(
            appBar: AppBar(
              title: const Text('Verify Email'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Please verify your email'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => viewModel.sendVerificationEmail(),
                    child: const Text('Resend Verification Email'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
