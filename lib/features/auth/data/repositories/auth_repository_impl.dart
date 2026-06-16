import 'package:blogger/features/auth/data/data-sources/auth_data_sources.dart';
import 'package:blogger/features/auth/data/models/user_model.dart';
import 'package:blogger/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSources authDataSources;

  AuthRepositoryImpl({required this.authDataSources});

  @override
  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final session = await authDataSources.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (session == null) {
      return null;
    }
    return UserModel(id: session.id, name: session.name, email: session.email);
  }

  @override
  Future<UserModel?> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    final session = await authDataSources.signUpWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
    if (session == null) {
      return null;
    }
    return UserModel(id: session.id, name: session.name, email: session.email);
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final session = await authDataSources.getCurrentUser();
    if (session == null) {
      return null;
    }
    return UserModel(id: session.id, name: session.name, email: session.email);
  }
}
