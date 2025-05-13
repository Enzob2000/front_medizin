


import 'package:front_medizin/Inicio/domain/entities/user.dart';
import 'package:front_medizin/iniciarsesion/domain/datasources/auth_datasource.dart';
import 'package:front_medizin/iniciarsesion/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<User> login(String email, String password) async {
    try {
      // Validaciones adicionales podrían ir aquí
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email y contraseña son requeridos');
      }

      final user = await dataSource.login(email, password);
      return user;
    } catch (e) {
      // Puedes transformar excepciones específicas aquí
      throw Exception('Error en el repositorio: $e');
    }
  }

  @override
  Future<User> loginWithGoogle() async {
    try {
      final user = await dataSource.loginWithGoogle();
      return user;
    } catch (e) {
      throw Exception('Error con Google: $e');
    }
  }

  @override
  Future<User> loginWithFacebook() async {
    try {
      final user = await dataSource.loginWithFacebook();
      return user;
    } catch (e) {
      throw Exception('Error con Facebook: $e');
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      if (email.isEmpty) {
        throw Exception('Email es requerido');
      }

      await dataSource.forgotPassword(email);
    } catch (e) {
      throw Exception('Error al recuperar contraseña: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await dataSource.logout();
    } catch (e) {
      throw Exception('Error al cerrar sesión: $e');
    }
  }
}
