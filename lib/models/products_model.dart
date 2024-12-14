class ProductsModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final Rating? rating; // الحقل اختياري

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating, // لا حاجة لقيم افتراضية
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null
          ? Rating.fromJson(json['rating']) // إذا كانت موجودة
          : null, // إذا لم تكن موجودة
    );
  }
}

class Rating {
  final dynamic rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'], // لا حاجة لقيم افتراضية
      count: json['count'],
    );
  }
}
