import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel/views/hotel_list_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String? userEmail;
  String? userName;
  String? userPhotoUrl;

  bool get isLoggedIn => _googleSignIn.currentUser != null;

  Future<void> googleSignIn(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await _googleSignIn.signIn();
      if (_googleSignIn.currentUser != null) {
        userEmail = _googleSignIn.currentUser!.email;
        userName = _googleSignIn.currentUser!.displayName;
        userPhotoUrl = _googleSignIn.currentUser!.photoUrl;

        await prefs.setString('userEmail', userEmail!);
        await prefs.setString('userName', userName!);
        await prefs.setString('userPhotoUrl', userPhotoUrl!);

        notifyListeners();
      }
    } catch (error) {
      log('Google sign in failed: $error');
    }
  }

  Future<void> navigateToHotelListView(BuildContext context) async {
    await googleSignIn(context);
    if (isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HotelListView(),
        ),
      );
    } else {
      log('User is not logged in.');
    }
  }
}
