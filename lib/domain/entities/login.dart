// import 'package:flutter_base_bloc/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    String? usename,
    String? password,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
