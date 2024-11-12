import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  String? message;
  List<Product>? products;

  ProductModel({this.message, this.products});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class Product {
  int? id;
  String? name;
  String? description;
  String? price;
  dynamic image;
  @JsonKey(name: 'created_at')
  String? createdAt;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
