// sign_in_view.dart
import 'package:auth/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../viewmodels/sign_in_out_viewmodel.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_password_field.dart';
import '../widgets/custom_elevated_button.dart';


class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Scaffold(
        body: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: viewModel.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      Image(
                        width: 194,
                        height: 187,
                        image: AssetImage('assets/images/login_image.png'),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 32),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff212121),
                        ),
                      ),
                      SizedBox(height: 28),
                      CustomTextFormField(
                        controller: viewModel.emailController,
                        labelText: 'Email',
                        obscureText: false,
                        validator: viewModel.emailValidator,
                      ),
                      const SizedBox(height: 5),
                      SizedBox(height: 14),
                      CustomPasswordField(
                        controller: viewModel.passwordController,
                        labelText: 'Password',
                        validator: viewModel.passwordValidator,
                      ),
                      const SizedBox(height: 28),
                      CustomElevatedButton(
                        onPressed: () => viewModel.signIn(context),
                        text: 'Login',
                      ),
                      const SizedBox(height: 28),
                      GestureDetector(
                        child: Text('I don\'t have an account'),
                        onTap: () => context.push(register_page),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
