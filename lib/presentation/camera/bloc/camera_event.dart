part of 'camera_bloc.dart';

@freezed
class CameraEvent extends BaseEvent with _$CameraEvent {
  const factory CameraEvent.started() = _Started;
}
