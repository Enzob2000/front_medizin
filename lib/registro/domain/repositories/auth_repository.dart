
import 'package:front_medizin/registro/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> register(String fullName, String email, String password);
  Future<void> verifyPhoneNumber(String phoneNumber);
}
