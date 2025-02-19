import 'dart:async';

import 'package:flutter_base_bloc/core/base/bloc/base_bloc.dart';
import 'package:flutter_base_bloc/presentation/home/common/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(_HomeState()) {
    on<_OnChangedPage>(_onChangePage);
  }

  FutureOr<void> _onChangePage(
      _OnChangedPage event, Emitter<HomeState> emit) async {
    if (state.currentPageType != event.type) {
      emit(
        state.copyWith(currentPageType: event.type),
      );
    }
  }
}
