
import 'package:flutter/material.dart';
import 'package:front_medizin/Inicio/domain/entities/user.dart';
import 'package:front_medizin/iniciarsesion/domain/repositories/auth_repository.dart';


class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthProvider(this.authRepository);

  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      _user = await authRepository.login(email, password);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Otros métodos...
}
