import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

class RegisterViewModel with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasDigit = false;
  bool hasSpecialCharacter = false;
  bool hasValidLength = false;

  void onPasswordChanged(String password) {
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
      hasSpecialCharacter = RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);
      hasValidLength = password.length >= 8 && password.length <= 15;
    }
    notifyListeners();
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (!hasUpperCase || !hasLowerCase || !hasDigit || !hasSpecialCharacter || !hasValidLength) {
      return 'Password does not meet all conditions';
    }
    return null;
  }

  Future<void> signUp(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        context.go(home_page);  // Adjust the route according to your app's navigation structure
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    loginController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }
}
