class Review {
  int? id;
  String? text;
  num? rating;

  Review({this.id, this.text, this.rating});

  factory Review.fromJson(dynamic json) {
    return Review(
      id: json['id'],
      text: json['text'],
      rating: json['rating'],
    );
  }
}
