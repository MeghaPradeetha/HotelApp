class Hotel {
  final int id;
  final String title;
  final String description;
  final String address;
  final String postcode;
  final String phoneNumber;
  final String latitude;
  final String longitude;
  final String imageUrl;

  Hotel({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.postcode,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      address: json['address'],
      postcode: json['postcode'],
      phoneNumber: json['phoneNumber'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      imageUrl: json['image']['small'],
    );
  }
}
