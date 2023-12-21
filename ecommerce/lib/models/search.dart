class Search {
  num? rating;
  num? berat;
  num? rangeMin;
  num? rangeMax;

  Search({this.rating, this.berat, this.rangeMin, this.rangeMax});

  Map<String, dynamic> toJson() {
    return ({
      "rating": rating,
      "berat": berat,
      "rangeMin": rangeMin,
      "rangeMax": rangeMax,
    });
  }
}
