


import 'package:front_medizin/Inicio/domain/datasources/auth_datasources.dart';
import 'package:front_medizin/Inicio/domain/entities/user.dart';
import 'package:front_medizin/Inicio/infrastructure/models/user_model.dart';

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<User> login(String email, String password) async {
    try {
      // Simulación de llamada a API
      await Future.delayed(const Duration(seconds: 1));

      // Validación básica (en una implementación real esto lo haría el backend)
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email y contraseña son requeridos');
      }

      // Retornamos un UserModel que es un User
      return UserModel(
        id: 'user-${email.hashCode}', // ID generado a partir del email
        email: email,
        name:
            'Usuario ${email.split('@').first}', // Extraemos el nombre del email
      );
    } catch (e) {
      // Capturamos cualquier error y lo relanzamos
      throw Exception('Error en login: ${e.toString()}');
    }
  }

  @override
  Future<User> register(String email, String password, String name) async {
    try {
      // Simulación de llamada a API
      await Future.delayed(const Duration(seconds: 1));

      // Validación básica
      if (email.isEmpty || password.isEmpty || name.isEmpty) {
        throw Exception('Todos los campos son requeridos');
      }

      if (password.length < 6) {
        throw Exception('La contraseña debe tener al menos 6 caracteres');
      }

      // Retornamos un UserModel
      return UserModel(
        id: 'new-user-${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        name: name,
      );
    } catch (e) {
      throw Exception('Error en registro: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
    // En una implementación real aquí limpiaríamos tokens o sesiones
  }
}
