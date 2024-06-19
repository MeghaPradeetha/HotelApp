import 'package:flutter/material.dart';
import '../models/hotel.dart';
import '../views/hotel_details_view.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HotelDetailsView(hotel: hotel),
            ),
          );
        },
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
              fontSize: 17,
            ),
          ),
          subtitle: Text(
            hotel.address,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
