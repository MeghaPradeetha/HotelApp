import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel/views/hotel_list_view.dart';

class LoginViewModel extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool get isLoggedIn => _googleSignIn.currentUser != null;

  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      notifyListeners();
    } catch (error) {
      log('Google sign in failed: $error');
    }
  }

  Future<void> navigateToHotelListView(BuildContext context) async {
    await signInWithGoogle();
    Future.delayed(Duration.zero, () {
      if (isLoggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HotelListView(),
          ),
        );
      }
    });
  }
}
