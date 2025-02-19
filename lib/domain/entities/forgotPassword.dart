import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgotPassword.freezed.dart';
part 'forgotPassword.g.dart';

@freezed
class ForgotpasswordModel with _$ForgotpasswordModel {
  const factory ForgotpasswordModel({
    String? email,
    String? password,
    String? confirmPassword,
  }) = _ForgotpasswordModel;

  factory ForgotpasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotpasswordModelFromJson(json);
}
