import 'package:blogger/core/common/user/domain/entities/user.dart';
import 'package:blogger/features/auth/domain/usecase/current_user.dart';
import 'package:blogger/features/auth/domain/usecase/user_signin.dart';
import 'package:blogger/features/auth/domain/usecase/user_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CurrentUser currentUser;
  final UserSignup userSignup;
  final UserSignin userSignin;

  AuthBloc({
    required this.currentUser,
    required this.userSignup,
    required this.userSignin,
  }) : super(AuthInitial()) {
    on<AuthSigninEvent>((event, emit) => _onAuthSigninEvent(event, emit));
    on<AuthSignupEvent>((event, emit) => _onAuthSignupEvent(event, emit));
    on<AuthCheckEvent>((event, emit) => _onAuthCheckEvent(event, emit));
  }

  void _onAuthSigninEvent(
    AuthSigninEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await userSignin(
      email: event.email,
      password: event.password,
    );
    if (response == null) {
      emit(AuthFailed(message: "Invalid credentials"));
    }
    emit(AuthSuccess(user: response!));
  }

  void _onAuthSignupEvent(
    AuthSignupEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final response = await userSignup(
      name: event.name,
      email: event.email,
      password: event.password,
    );
    if (response == null) {
      emit(AuthFailed(message: "Failed to sign up"));
    }
    emit(AuthSuccess(user: response!));
  }

  void _onAuthCheckEvent(AuthCheckEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await currentUser();
    if (response == null) {
      emit(AuthFailed(message: "Unauthenticated"));
    } else {
      emit(AuthSuccess(user: response));
    }
  }
}
