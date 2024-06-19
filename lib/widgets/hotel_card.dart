import 'package:flutter/material.dart';
import '../models/hotel.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          'assets/images/picture1.png',
          width: 50,
          height: 50,
        ),
        // leading: Image.network(hotel.imageUrl,
        //     width: 50, height: 50, fit: BoxFit.cover),
        title: Text(
          hotel.title,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(hotel.address),
      ),
    );
  }
}
