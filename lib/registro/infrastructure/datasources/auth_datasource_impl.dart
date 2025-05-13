

import 'package:front_medizin/registro/domain/datasources/auth_datasource.dart';
import 'package:front_medizin/registro/domain/entities/user.dart';
import 'package:front_medizin/registro/infrastructure/models/user_model.dart';

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<User> register(String fullName, String email, String password) async {
    // Implementación con Firebase/API
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(id: 'generated-id', fullName: fullName, email: email);
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    // Implementación de verificación
  }
}
