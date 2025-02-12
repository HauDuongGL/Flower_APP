import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_base_bloc/core/base/bloc/base_bloc.dart';
import 'package:flutter_base_bloc/gen/translations.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_base_bloc/domain/entities/forgotPassword.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

class ForgotPasswordBloc
    extends BaseBloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordState(false, '', false)) {
    on<_ForgotPassword>(_onForgotPassword);
  }

  FutureOr<void> _onForgotPassword(
      _ForgotPassword event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessgae: '', isSuccess: false));

    final SupabaseClient supabaseClient = Supabase.instance.client;

    try {
      await Future.any([
        supabaseClient.auth
            .resetPasswordForEmail(event.forgotPassword.email ?? ''),
        Future.delayed(const Duration(seconds: 30),
            () => throw TimeoutException(LocaleKeys.erorrMessage_Timeout.tr()))
      ]);

      if (supabaseClient.auth.currentSession == null) {
        emit(state.copyWith(
            isLoading: false,
            errorMessgae: LocaleKeys.erorrMessage_noEmail..tr()));
        return;
      }

      if (event.forgotPassword.password !=
          event.forgotPassword.confirmPassword) {
        emit(state.copyWith(
            isLoading: false,
            errorMessgae: LocaleKeys.erorrMessage_cofilmPassword.tr()));
        return;
      }

      await Future.any([
        supabaseClient.auth.updateUser(
            UserAttributes(password: event.forgotPassword.password ?? '')),
        Future.delayed(const Duration(seconds: 30),
            () => throw TimeoutException(LocaleKeys.erorrMessage_Timeout.tr()))
      ]);

      emit(state.copyWith(isLoading: false, isSuccess: true));
    } on TimeoutException catch (_) {
      emit(state.copyWith(
          isLoading: false,
          errorMessgae: LocaleKeys.erorrMessage_Timeout.tr()));
    } on AuthException catch (e) {
      if (e.message.contains('rate limit')) {
        emit(state.copyWith(
            isLoading: false,
            errorMessgae: LocaleKeys.erorrMessage_forgotPassword.tr()));
      } else {
        emit(state.copyWith(isLoading: false, errorMessgae: e.message));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessgae: e.toString()));
    }
  }
}
