import 'package:flutter/material.dart';
import 'package:hotel/services/api/hotel_api.dart';
import '../models/hotel.dart';

class HotelListViewModel extends ChangeNotifier {
  List<Hotel> _hotels = [];
  List<Hotel> filteredHotels = [];
  bool isLoading = false;

  List<Hotel> get hotels => _hotels;

  Future<void> fetchHotels() async {
    isLoading = true;
    notifyListeners();
    try {
      _hotels = await HotelApi.fetchHotels();
      filteredHotels = _hotels;
    } catch (e) {
      throw Exception('Failed to load hotels');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void searchHotels(String query) {
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
}
