class Barang {
  final String name;
  final String brand;
  final String imageURL;
  final int price;

  Barang(this.name, this.brand, this.imageURL, this.price);

  factory Barang.fromJson(Map<String, dynamic> json) {
    return new Barang(
      json["name"],
      json["brand"],
      json["imageURL"],
      json["price"]
    );
  }
}