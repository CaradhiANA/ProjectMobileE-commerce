import 'package:ecommerce/models/reviews.dart';

class Product {
  String? nama;
  int? harga;
  int? stock;
  String? image;
  String? imageUrl;
  String? kadaluarsa;
  int? berat;
  num? rating;
  List<Review>? reviews;

  Product({
    this.nama,
    this.harga,
    this.stock,
    this.image,
    this.imageUrl,
    this.kadaluarsa,
    this.berat,
    this.rating,
    this.reviews,
  });

  factory Product.fromJson(dynamic json) {
    return Product(
      nama: json['nama'],
      harga: json['harga'],
      stock: json['stock'],
      image: json['image'],
      imageUrl: json['imageUrl'],
      kadaluarsa: json['kadaluarsa'],
      berat: json['berat'],
      rating: json['rating'],
    );
  }
}
