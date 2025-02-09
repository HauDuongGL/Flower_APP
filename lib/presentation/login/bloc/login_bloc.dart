import 'dart:async';

import 'package:flutter_base_bloc/core/base/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_base_bloc/domain/entities/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState(false, '', false)) {
    on<_Login>(_onLogin);
  }

  FutureOr<void> _onLogin(_Login event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: '', isSuccess: false));

    try {
      final supabase = Supabase.instance.client;

      final response = await supabase.auth.signInWithPassword(
        email: event.loginModel.usename,
        password: event.loginModel.password!,
      );

      if (response.user != null) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(state.copyWith(
            isLoading: false, errorMessage: "Sai tài khoản hoặc mật khẩu"));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
