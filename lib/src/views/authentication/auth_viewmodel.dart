import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  String? _token;
  String? _errorMessage;
  bool _isLoading = false;
  User? _currentUser;

  String? get token => _token;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  User? get currentUser => _currentUser;

  // Login method
  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _authService.login(email, password);
      if (response != null) {
        _token = response['token'];
        _currentUser = User.fromJson(response['user']);
      } else {
        _errorMessage = "Invalid email or password.";
      }
    } catch (e) {
      _errorMessage = "An error occurred during login.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Register method
  Future<void> register(String email, String password, String name) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _authService.register(email, password, name);
      if (response != null) {
        _token = response['token'];
        _currentUser = User.fromJson(response['user']);
      } else {
        _errorMessage = "Signup failed. Please try again.";
      }
    } catch (e) {
      _errorMessage = "An error occurred during signup.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update user profile method
  Future<void> updateUserProfile(
      String name, String phone, String address) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Update the user profile locally (for now)
      // _currentUser = _currentUser?.copyWith(
      //   name: name,
      //   phone: phone,
      //   address: address,
      // );
      // // Call an API to update the server (optional, if backend supports it)
      // // final response = await _authService.updateUserProfile(name, phone, address);
      notifyListeners();
    } catch (e) {
      _errorMessage = "An error occurred while updating the profile.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _token = null;
    _currentUser = null;
    notifyListeners();
  }

  bool isLoggedIn() {
    return _token != null;
  }
}
