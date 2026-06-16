import 'package:blogger/core/common/user/domain/entities/user.dart';
import 'package:blogger/features/auth/domain/repositories/auth_repository.dart';

class UserSignin {
  final AuthRepository authRepository;

  UserSignin({required this.authRepository});

  Future<AppUser> call({
    required String email,
    required String password,
  }) async {
    final response = await authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return AppUser(id: response.id, name: response.name, email: response.email);
  }
}
