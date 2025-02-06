part of 'register_bloc.dart';

@freezed
class RegisterEvent extends BaseEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = _Started;
}
