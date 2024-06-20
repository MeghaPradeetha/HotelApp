import 'package:flutter/material.dart';
import 'package:hotel/services/api/hotel_api.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hotel/views/login_view.dart';
import 'package:hotel/widgets/alert_dialog.dart';
import '../models/hotel.dart';

class HotelListViewModel extends ChangeNotifier {
  List<Hotel> _hotels = [];
  List<Hotel> filteredHotels = [];
  bool isLoading = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  List<Hotel> get hotels => _hotels;

  //fetch all hotels using api call
  Future<void> fetchAllHotels() async {
    isLoading = true;
    notifyListeners();
    try {
      _hotels = await HotelApi.fetchHotelsData();
      filteredHotels = _hotels;
    } catch (e) {
      throw Exception('Failed to load hotels');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //logic of the search filter
  void searchHotelsByName(String query) {
    if (query.isEmpty) {
      filteredHotels = _hotels;
    } else {
      filteredHotels = _hotels
          .where((hotel) =>
              hotel.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  //google signout function
  Future<void> signOut(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => HotelAlertDialog(
        title: 'Logout',
        content: 'Do you wish to logout?',
        cancelText: 'Cancel',
        confirmText: 'Yes',
        onConfirm: () async {
          await _googleSignIn.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ),
          );
        },
      ),
    );
  }
}
