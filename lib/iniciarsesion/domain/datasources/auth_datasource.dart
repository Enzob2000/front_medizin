import 'package:front_medizin/Inicio/domain/entities/user.dart';

abstract class AuthDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password, String name);
  Future<User> loginWithGoogle();
  Future<User> loginWithFacebook();
  Future<void> logout();
  Future<void> forgotPassword(String email);
}
