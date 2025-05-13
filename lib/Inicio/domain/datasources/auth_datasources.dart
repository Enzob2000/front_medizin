
import 'package:front_medizin/Inicio/domain/entities/user.dart';
import 'package:front_medizin/Inicio/infrastructure/models/user_model.dart';

abstract class AuthDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password, String name);
  Future<void> logout();
}
