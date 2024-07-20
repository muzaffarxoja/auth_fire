// verify_email_view.dart
import 'package:auth/views/new_signup_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/verify_email_viewmodel.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VerifyEmailViewModel(),
      child: Consumer<VerifyEmailViewModel>(
        builder: (context, viewModel, child) {
          return viewModel.isEmailVerified
              ? NewSignupView()
              : Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => context.pop(),
                    ),
                    title: const Text('Verify Email'),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('We have send verification link to your email for finishing signing up'),
                        const SizedBox(height: 20),
                        const Text('If you don\'t receive email don\'t harry, check your spam inbox'),
                        const SizedBox(height: 20),
                        const Text('(´｡• ω •｡`)'),
                        SizedBox(height: 20),
                        Image(
                          height: 225,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/verification_image.png'),
                        ),

                        GestureDetector(
                          child: const Text('Email has not come'),
                          onTap: viewModel.canResendEmail
                              ? () async {
                                  await viewModel.sendVerificationEmail();
                                }
                              : null,
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
