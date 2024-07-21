// verify_email_view.dart
import 'package:auth/main.dart';
import 'package:auth/views/after_first_signup_view.dart';
import 'package:auth/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/verify_email_viewmodel.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});


  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: AlertDialog(
            title: Text('We have sent one more mail on your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff212121),
                ),),
            content: Text('Dont forget check your spam',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff212121),
              ),),
            actions: [
              CustomElevatedButton(text: 'Got it', onPressed: () => context.pop(),),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VerifyEmailViewModel(),
      child: Consumer<VerifyEmailViewModel>(
        builder: (context, viewModel, child) {
          return viewModel.isEmailVerified
              ? AfterFirstSignUp()
              : Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => context.go(register_page),
                    ),
                    title: const Text('Registration'),
                  ),
                  body: Padding(
                    padding: EdgeInsets.all(31),
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          textAlign: TextAlign.center,
                          'We have send verification link to your email for finishing signing up',
                          style: TextStyle(

                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff212121),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          textAlign: TextAlign.center,
                          'If you don\'t receive email don\'t harry, check your spam inbox',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff212121),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('(´｡• ω •｡`)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff212121),
                          ),),
                        SizedBox(height: 58),

                        // Expanded(
                        //   child: Image.asset(
                        //     'assets/images/verification_image.png',
                        //     height: 225,
                        //     width: double.maxFinite,
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),

                        Container(
                            height: 225,
                            width: double.maxFinite,
                          child:  Image(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/verification_image.png'),
                          ),
                        ),
                        const SizedBox(height: 56),
                        GestureDetector(
                          child: const Text('I have not receive email'),
                          onTap: viewModel.canResendEmail
                              ? () async {
                                  await viewModel.sendVerificationEmail();
                                  _showInfoDialog(context);
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
