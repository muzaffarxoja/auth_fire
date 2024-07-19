// login_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../viewmodels/login_view_model.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_password_field.dart';
import '../widgets/custom_elevated_button.dart';


class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: viewModel.emailController,
                    labelText: 'Email',
                    obscureText: false,
                    validator: viewModel.emailValidator,
                  ),
                  const SizedBox(height: 5),
                  CustomPasswordField(
                    controller: viewModel.passwordController,
                    labelText: 'Password',
                    validator: viewModel.passwordValidator,
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    onPressed: () => viewModel.signIn(context),
                    text: 'Login',
                  ),
                  const SizedBox(height: 28),
                  TextButton(
                    onPressed: () => context.push('/register'),
                    child: Text('I don\'t have an account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
