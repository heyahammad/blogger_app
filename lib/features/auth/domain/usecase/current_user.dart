import 'package:blogger/core/common/user/domain/entities/user.dart';
import 'package:blogger/features/auth/domain/repositories/auth_repository.dart';

class CurrentUser {
  final AuthRepository authRepository;

  CurrentUser({required this.authRepository});

  Future<AppUser?> call() async {
    final response = await authRepository.getCurrentUser();

    if (response == null) {
      return null;
    } else {
      return AppUser(
        id: response.id,
        name: response.name,
        email: response.email,
      );
    }
  }
}
