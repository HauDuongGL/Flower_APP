import 'package:flutter_base_bloc/core/base/bloc/base_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_event.dart';
part 'camera_state.dart';
part 'camera_bloc.freezed.dart';

class CameraBloc extends BaseBloc<CameraEvent, CameraState> {
  CameraBloc() : super(_Initial()) {
    on<CameraEvent>((event, emit) {});
  }
}
