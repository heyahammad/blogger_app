import 'package:blogger/features/auth/data/models/user_model.dart';

abstract interface class AuthRepository {
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
