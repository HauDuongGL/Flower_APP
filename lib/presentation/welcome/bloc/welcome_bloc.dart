import 'package:flutter_base_bloc/core/base/bloc/base_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';
part 'welcome_bloc.freezed.dart';

class WelcomeBloc extends BaseBloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(_Initial()) {
    on<WelcomeEvent>((event, emit) {});
  }
}
