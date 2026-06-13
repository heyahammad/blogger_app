import 'package:blogger/features/user/presentation/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserCheckAuthentication>(
      (event, emit) => _onUSerCheckAuthentication(event: event, emit: emit),
    );
  }

  /* 

here the user is checked if it is authenticated or not, 
if the user is authenticated then the state is changed to UserAuthenticated 
and if the user is not authenticated then the state is changed to UserUnauthenticated.

 */

  void _onUSerCheckAuthentication({
    required UserCheckAuthentication event,
    required Emitter<UserState> emit,
  }) {
    if (event.user != null) {
      emit(UserAuthenticated(user: event.user!));
    } else {
      emit(UserUnauthenticated());
    }
  }
}
