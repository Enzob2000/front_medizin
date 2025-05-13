
import 'package:flutter/material.dart';
import 'package:front_medizin/Inicio/domain/entities/user.dart';
import 'package:front_medizin/Inicio/domain/repositories/auth_repository.dart';

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
      debugPrint('Login error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(String email, String password, String name) async {
    try {
      _isLoading = true;
      notifyListeners();

      _user = await authRepository.register(email, password, name);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint('Registration error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _user = null;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
