import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyEmailViewModel with ChangeNotifier {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  VerifyEmailViewModel() {
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (isEmailVerified) timer?.cancel();

    notifyListeners();
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      canResendEmail = false;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 30));
      canResendEmail = true;
      notifyListeners();


    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
