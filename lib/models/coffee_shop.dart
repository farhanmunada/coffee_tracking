// Model data untuk Coffee Shop
import 'comment.dart';

class CoffeeShop {
  final int id;
  final String name;
  final String address;
  final String photoUrl;
  final String openHours;
  final String contact;
  final double rating;
  final List<Comment> comments;
  final double lat;
  final double lng;

  CoffeeShop({
    required this.id,
    required this.name,
    required this.address,
    required this.photoUrl,
    required this.openHours,
    required this.contact,
    required this.rating,
    required this.comments,
    required this.lat,
    required this.lng,
  });

  factory CoffeeShop.fromJson(Map<String, dynamic> json) {
    return CoffeeShop(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      photoUrl: json['photoUrl'],
      openHours: json['openHours'],
      contact: json['contact'],
      rating: (json['rating'] as num).toDouble(),
      comments: (json['comments'] as List)
          .map((c) => Comment.fromJson(c))
          .toList(),
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }
}
