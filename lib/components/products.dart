import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Product {
  Product({
    required this.title,
    required this.description,
    required this.fullDescription,
    required this.url,
    required this.img,
  });

  final String title;
  final String description;
  final String url;
  final String fullDescription;
  final String img;


  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
  