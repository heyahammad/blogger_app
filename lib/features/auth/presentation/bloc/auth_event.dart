part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthSigninEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSigninEvent({required this.email, required this.password});
}

class AuthSignupEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  AuthSignupEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class AuthCheckEvent extends AuthEvent {}
