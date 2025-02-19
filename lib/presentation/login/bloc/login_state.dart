part of 'login_bloc.dart';

@freezed
class LoginState extends BaseState with _$LoginState {
  const factory LoginState(
    bool isLoading,
    String errorMessage,
    bool isSuccess,
  ) = _LoginState;
}
