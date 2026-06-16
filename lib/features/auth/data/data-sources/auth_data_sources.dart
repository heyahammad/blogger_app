import 'package:blogger/core/error/app_exceptions.dart';
import 'package:blogger/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthDataSources {
  Session? get currentUserSession;

  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUser();
}

class AuthDataSourcesImpl implements AuthDataSources {
  final SupabaseClient supabaseClient;

  AuthDataSourcesImpl({required this.supabaseClient});

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel?> getCurrentUser() async {
    if (currentUserSession != null) {
      final user = UserModel.fromMap(currentUserSession!.user.toJson());
      return user;
    } else {
      return null;
    }
  }

  @override
  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final AuthResponse response = await supabaseClient.auth.signInWithPassword(
      password: password,
      email: email,
    );

    try {
      if (response.user == null) {
        throw AppExceptions(message: 'Failed to sign in user');
      } else {
        return UserModel.fromMap(response.user!.toJson());
      }
    } on AuthException catch (e) {
      throw AppExceptions(message: 'Failed to sign in user: ${e.message}');
    } catch (e) {
      throw AppExceptions(message: 'Failed to sign in user $e');
    }
  }

  @override
  Future<UserModel?> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );

      if (response.user == null) {
        throw AppExceptions(message: 'Failed to sign up user');
      } else {
        return UserModel.fromMap(response.user!.toJson());
      }
    } on AuthException catch (e) {
      throw AppExceptions(message: 'Failed to sign up user: ${e.message}');
    } catch (e) {
      throw AppExceptions(message: 'Failed to sign up user: $e');
    }
  }
}
