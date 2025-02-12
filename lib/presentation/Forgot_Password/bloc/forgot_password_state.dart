part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState extends BaseState with _$ForgotPasswordState {
  const factory ForgotPasswordState(
    bool isLoading,
    String errorMessgae,
    bool isSuccess,
  ) = _ForgotPasswordState;
}
