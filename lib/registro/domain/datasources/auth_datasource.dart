import 'package:front_medizin/registro/domain/entities/user.dart';
import 'package:front_medizin/registro/infrastructure/models/user_model.dart';

abstract class AuthDataSource {
  Future<User> register(String fullName, String email, String password);
  Future<void> verifyPhoneNumber(String phoneNumber);
}
