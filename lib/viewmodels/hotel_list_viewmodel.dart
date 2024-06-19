import 'package:flutter/material.dart';
import 'package:hotel/services/api/hotel_api.dart';
import '../models/hotel.dart';

class HotelListViewModel extends ChangeNotifier {
  List<Hotel> _hotels = [];
  List<Hotel> filteredHotels = [];

  List<Hotel> get hotels => _hotels;

  Future<void> fetchHotels() async {
    try {
      _hotels = await HotelApi.fetchHotels();
      filteredHotels = _hotels;
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to load hotels');
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
