

import 'package:front_medizin/Inicio/domain/datasources/auth_datasources.dart';
import 'package:front_medizin/Inicio/domain/entities/user.dart';
import 'package:front_medizin/Inicio/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<User> login(String email, String password) async {
    return await dataSource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String name) async {
    return await dataSource.register(email, password, name);
  }

  @override
  Future<void> logout() async {
    await dataSource.logout();
  }
}
