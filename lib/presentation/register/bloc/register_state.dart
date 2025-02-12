part of 'register_bloc.dart';

@freezed
class RegisterState extends BaseState with _$RegisterState {
  const factory RegisterState(
    bool isLoading,
    String errorMessage,
    bool isSuccess,
  ) = _RegisterState;
}
