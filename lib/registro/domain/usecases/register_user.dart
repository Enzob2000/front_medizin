
import 'package:front_medizin/registro/domain/entities/user.dart';
import 'package:front_medizin/registro/domain/repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<User> execute(String fullName, String email, String password) {
    return repository.register(fullName, email, password);
  }
}
