class FavoriteProduct {
  final int id;
  final String title;
  final String image;
  final double price;

  FavoriteProduct({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  factory FavoriteProduct.fromMap(Map<String, dynamic> map) {
    return FavoriteProduct(
      id: map['id'],
      title: map['title'],
      image: map['image'],
      price: (map['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "image": image,
      "price": price,
    };
  }
}
