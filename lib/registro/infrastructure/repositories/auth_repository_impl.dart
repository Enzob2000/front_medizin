

import 'package:front_medizin/registro/domain/datasources/auth_datasource.dart';
import 'package:front_medizin/registro/domain/entities/user.dart';
import 'package:front_medizin/registro/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<User> register(String fullName, String email, String password) async {
    try {
      // 1. Validación básica (opcional, podría estar en el dominio)
      if (password.length < 6) {
        throw Exception('La contraseña debe tener al menos 6 caracteres');
      }

      // 2. Llamada al datasource
      final user = await dataSource.register(fullName, email, password);

      // 3. Mapeo a entidad de dominio
      return User(
        id: user.id,
        fullName: user.fullName,
        email: user.email,
        phoneNumber: user.phoneNumber,
      );
    } catch (e) {
      // 4. Manejo de errores y transformación a excepciones de dominio
      throw Exception('Error en el registro: ${e.toString()}');
    }
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await dataSource.verifyPhoneNumber(phoneNumber);
    } catch (e) {
      throw Exception('Error en verificación telefónica: ${e.toString()}');
    }
  }
}
