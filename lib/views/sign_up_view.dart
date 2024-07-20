import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../viewmodels/sign_up_viewmodel.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_password_field.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegisterViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => context.pop(),
          ),
          title: const Center(
            child: Text(
              'Registration',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                'Create account \nLorby',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff212121),
                  fontWeight: FontWeight.w500
                ),
              ),
              Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: viewModel.emailController,
                      labelText: 'Enter Email',
                      obscureText: false,
                      validator: viewModel.emailValidator,
                    ),
                    const SizedBox(height: 14),
                    CustomTextFormField(
                      controller: viewModel.loginController,
                      labelText: 'Enter login',
                      obscureText: false,
                    ),
                    const SizedBox(height: 14),
                    CustomPasswordField(
                      controller: viewModel.passwordController,
                      labelText: 'Password',
                      onChanged: viewModel.onPasswordChanged,
                      validator: viewModel.passwordValidator,
                    ),
                    const SizedBox(height: 10),
                    PasswordCriteriaRow(
                      text: 'At least 1 uppercase letter',
                      isValid: viewModel.hasUpperCase,
                    ),
                    PasswordCriteriaRow(
                      text: 'At least 1 lowercase letter',
                      isValid: viewModel.hasLowerCase,
                    ),
                    PasswordCriteriaRow(
                      text: 'At least 1 digit',
                      isValid: viewModel.hasDigit,
                    ),
                    PasswordCriteriaRow(
                      text: 'At least 1 special character',
                      isValid: viewModel.hasSpecialCharacter,
                    ),
                    PasswordCriteriaRow(
                      text: '8 to 15 characters long',
                      isValid: viewModel.hasValidLength,
                    ),
                    const SizedBox(height: 14),
                    CustomPasswordField(
                      controller: viewModel.passwordConfirmController,
                      labelText: 'Confirm password',
                      onChanged: null,
                      validator: viewModel.isPasswordSame,
                    ),
                    const SizedBox(height: 14),
                    CustomElevatedButton(
                      onPressed: () => viewModel.signUp(context),
                      text: 'Register',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordCriteriaRow extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordCriteriaRow({required this.text, required this.isValid});

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black; // Default text color

    if (isValid) {
      textColor = Colors.green;
    }

    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
        const SizedBox(width: 10),
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
        ),
      ],
    );
  }
}
