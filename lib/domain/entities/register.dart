import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.freezed.dart';
part 'register.g.dart';

@freezed
class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}
