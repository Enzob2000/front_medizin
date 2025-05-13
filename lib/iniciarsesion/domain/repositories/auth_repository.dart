
import 'package:front_medizin/Inicio/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> loginWithGoogle();
  Future<User> loginWithFacebook();
  Future<void> forgotPassword(String email);
}
