import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
	String? message;
	String? token;

	LoginModel({this.message, this.token});

	factory LoginModel.fromJson(Map<String, dynamic> json) {
		return _$LoginModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
