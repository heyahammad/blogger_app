part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class UserInitialEvent extends UserEvent {}

final class UserCheckAuthentication extends UserEvent {
  final User? user;
  UserCheckAuthentication({required this.user});
}
