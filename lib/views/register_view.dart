
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasDigit = false;
  bool hasSpecialCharacter = false;
  bool hasValidLength = false;

  void _onPasswordChanged(String password) {
    setState(() {
      if (password.isEmpty) {
        hasUpperCase = false;
        hasLowerCase = false;
        hasDigit = false;
        hasSpecialCharacter = false;
        hasValidLength = false;
      } else {
        hasUpperCase = RegExp(r'[A-Z]').hasMatch(password);
        hasLowerCase = RegExp(r'[a-z]').hasMatch(password);
        hasDigit = RegExp(r'[0-9]').hasMatch(password);
        hasSpecialCharacter =
            RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);
        hasValidLength = password.length >= 8 && password.length <= 15;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
           leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
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
              const SizedBox(height: 20),
              const Text(
                'Create account \nLorby',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff212121),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                        controller: emailController,
                        labelText: 'Enter Email',
                        obscureText: false),
                    const SizedBox(height: 14),
                    CustomTextFormField(
                        controller: loginController,
                        labelText: 'Enter login',
                        obscureText: false),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onChanged: _onPasswordChanged,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (!hasUpperCase ||
                            !hasLowerCase ||
                            !hasDigit ||
                            !hasSpecialCharacter ||
                            !hasValidLength) {
                          return 'Password does not meet all conditions';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    PasswordCriteriaRow(
                        text: 'At least 1 uppercase letter',
                        isValid: hasUpperCase),
                    PasswordCriteriaRow(
                        text: 'At least 1 lowercase letter',
                        isValid: hasLowerCase),
                    PasswordCriteriaRow(
                        text: 'At least 1 digit', isValid: hasDigit),
                    PasswordCriteriaRow(
                        text: 'At least 1 special character',
                        isValid: hasSpecialCharacter),
                    PasswordCriteriaRow(
                        text: '8 to 15 characters long', isValid: hasValidLength),
                    SizedBox(height: 14),
                    CustomTextFormField(
                        controller: passwordConfirmController,
                        labelText: 'Confirm password',
                        obscureText: false),
                    const SizedBox(height: 14),
                    CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                            signUp();

                          // Process the registration
                        }
                      },
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
 Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: _passwordController.text.trim());
    }
    on FirebaseAuthException catch(e) {
      debugPrint(e as String?);
      
    }
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
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ],
    );
  }
}
