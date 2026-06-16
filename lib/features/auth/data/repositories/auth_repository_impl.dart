import 'package:blogger/features/auth/data/data-sources/auth_data_sources.dart';
import 'package:blogger/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:blogger/core/common/user/domain/entities/user.dart';

abstract interface class AuthDataRepository {
  Future<AppUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<AppUser> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<AppUser?> getCurrentUser();
}

class AuthDataRepositoryImpl implements AuthDataRepository {
  final AuthDataSources authDataSources;

  AuthDataRepositoryImpl({required this.authDataSources});

  @override
  Future<AppUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final session = await authDataSources.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return AppUser(id: session.id, name: session.name, email: session.email);
  }

  @override
  Future<AppUser> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    final session = await authDataSources.signUpWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
    return AppUser(id: session.id, name: session.name, email: session.email);
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    final session = await authDataSources.getCurrentUser();
    if (session == null) {
      return null;
    }
    return AppUser(id: session.id, name: session.name, email: session.email);
  }
}
