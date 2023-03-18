import '../../models/products/products.dart';

class ProductsResponse {
  List<Products>? data;

  ProductsResponse({this.data});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
