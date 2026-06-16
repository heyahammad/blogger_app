part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AppUser user;

  AuthSuccess({required this.user});
}

final class AuthFailed extends AuthState {
  final String message;

  AuthFailed({required this.message});
}

final class Authenticated extends AuthState {
  final AppUser user;

  Authenticated({required this.user});
}
