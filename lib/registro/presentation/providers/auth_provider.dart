
import 'package:flutter/material.dart';
import 'package:front_medizin/registro/domain/usecases/register_user.dart';

class AuthProvider extends ChangeNotifier {
  final RegisterUser registerUser;

  AuthProvider(this.registerUser);

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      await registerUser.execute(fullName, email, password);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
