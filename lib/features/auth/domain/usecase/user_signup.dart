import 'package:blogger/core/common/user/domain/entities/user.dart';
import 'package:blogger/features/auth/domain/repositories/auth_repository.dart';

class UserSignup {
  final AuthRepository authRepository;

  UserSignup({required this.authRepository});

  Future<AppUser?> call({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await authRepository.signUpWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
    if (response == null) {
      return null;
    }
    return AppUser(id: response.id, name: response.name, email: response.email);
  }
}
