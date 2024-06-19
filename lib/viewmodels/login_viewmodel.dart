import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      notifyListeners();
    } catch (error) {
      log('Google sign in failed: $error');
    }
  }

  bool get isLoggedIn => _googleSignIn.currentUser != null;
}
