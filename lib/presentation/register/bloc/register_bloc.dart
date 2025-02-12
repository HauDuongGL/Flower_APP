import 'dart:async';

import 'package:flutter_base_bloc/core/base/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_base_bloc/domain/entities/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState(false, '', false)) {
    on<_Register>(_onRegister);
  }

  FutureOr<void> _onRegister(
      _Register event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: '', isSuccess: false));

    if (event.registerModel.password != event.registerModel.confirmPassword) {
      emit(state.copyWith(
          isLoading: false, errorMessage: "Mật khẩu xác nhận không khớp"));
      return;
    }

    try {
      final supabase = Supabase.instance.client;

      final response = await supabase.auth.signUp(
        email: event.registerModel.email,
        password: event.registerModel.password ?? '',
        data: {'username': event.registerModel.username},
      );

      if (response.user != null) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(state.copyWith(
            isLoading: false, errorMessage: "Đăng ký thất bại, thử lại sau"));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
