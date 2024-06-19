import 'package:flutter/material.dart';
import '../models/hotel.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading: Image.network(hotel.imageUrl,
        //     width: 50, height: 50, fit: BoxFit.cover),
        title: Text(hotel.title),
        subtitle: Text(hotel.address),
      ),
    );
  }
}
