
import 'package:front_medizin/Inicio/domain/entities/user.dart';
import 'package:front_medizin/iniciarsesion/domain/repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<User> execute(String email, String password) {
    return repository.login(email, password);
  }
}
