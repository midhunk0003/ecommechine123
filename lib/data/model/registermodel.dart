import 'package:json_annotation/json_annotation.dart';
part 'registermodel.g.dart';

@JsonSerializable()
class RegisterModel {
  @JsonKey(name: "message")
  String message;

  RegisterModel({
    required this.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
