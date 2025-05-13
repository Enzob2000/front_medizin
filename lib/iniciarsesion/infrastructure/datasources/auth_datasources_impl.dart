
import 'package:front_medizin/Inicio/domain/entities/user.dart';
import 'package:front_medizin/iniciarsesion/domain/datasources/auth_datasource.dart';
import 'package:front_medizin/iniciarsesion/infrastructure/models/user_model.dart';

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<User> login(String email, String password) async {
    // Simulación de autenticación
    await Future.delayed(const Duration(seconds: 1));

    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email y contraseña son requeridos');
    }

    return UserModel(
      id: 'user-${email.hashCode}',
      email: email,
      name: 'Usuario ${email.split('@').first}',
    );
  }

  @override
  Future<User> register(String email, String password, String name) async {
    await Future.delayed(const Duration(seconds: 1));

    if (password.length < 6) {
      throw Exception('La contraseña debe tener al menos 6 caracteres');
    }

    return UserModel(
      id: 'new-user-${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      name: name,
    );
  }

  Future<User> loginWithGoogle() async {
    // Implementación para autenticación con Google
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: 'google-user-${DateTime.now().millisecondsSinceEpoch}',
      email: 'googleuser@example.com',
      name: 'Google User',
    );
  }

  Future<User> loginWithFacebook() async {
    // Implementación para autenticación con Facebook
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: 'facebook-user-${DateTime.now().millisecondsSinceEpoch}',
      email: 'facebookuser@example.com',
      name: 'Facebook User',
    );
  }

  @override
  Future<void> logout() async {
    // Simulación de cierre de sesión
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> forgotPassword(String email) async {
    if (email.isEmpty) {
      throw Exception('El email es requerido');
    }
    await Future.delayed(const Duration(seconds: 1));
  }
}
