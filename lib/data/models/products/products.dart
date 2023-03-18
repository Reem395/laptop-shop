class Products {
  int? id;
  String? brand;
  String? model;
  int? price;
  String? type;
  String? description;
  List<dynamic>? images;
  String? specs;

  Products({
    this.id,
    this.brand,
    this.model,
    this.price,
    this.type,
    this.description,
    this.images,
    this.specs,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json['id'] as int?,
        brand: json['brand'] as String?,
        model: json['model'] as String?,
        price: json['price'] as int?,
        type: json['type'] as String?,
        description: json['description'] as String?,
        images: json['images'] as List<dynamic>?,
        specs: json['specs'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'brand': brand,
        'model': model,
        'price': price,
        'type': type,
        'description': description,
        'images': images,
        'specs': specs,
      };
}
