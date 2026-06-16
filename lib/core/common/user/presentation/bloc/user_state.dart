part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserAuthenticated extends UserState {
  final AppUser user;

  UserAuthenticated({required this.user});
}

final class UserUnauthenticated extends UserState {}

final class UserLoading extends UserState {}
