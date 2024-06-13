class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
    );
  }

  double findDiscountedPrice(int price, double discountPercentage) {
    if (price == null || discountPercentage == null) {
      throw ArgumentError("Price and discountPercentage must not be null");
    }
    if (discountPercentage < 0 || discountPercentage > 100) {
      throw ArgumentError("Discount percentage must be between 0 and 100");
    }
    double discountAmount = (discountPercentage / 100) * price;
    double discountedPrice = price - discountAmount;
    return discountedPrice;
  }
}
