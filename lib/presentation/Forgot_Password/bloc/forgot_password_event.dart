part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent extends BaseEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.started() = _Started;
  const factory ForgotPasswordEvent.forgotPassword(
      {required ForgotpasswordModel forgotPassword}) = _ForgotPassword;
}
