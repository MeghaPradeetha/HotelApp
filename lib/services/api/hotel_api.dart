import 'dart:convert';
import 'package:hotel/services/network/end_points.dart';
import 'package:http/http.dart' as http;
import '../../models/hotel.dart';

class HotelApi {
  static Future<List<Hotel>> fetchHotels() async {
    final response = await http.get(
      Uri.parse(EndPoints.hotelGET),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hotelsJson = jsonResponse['data'];
      return hotelsJson.map((hotelJson) => Hotel.fromJson(hotelJson)).toList();
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}
