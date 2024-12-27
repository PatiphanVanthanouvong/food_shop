import 'package:dio/dio.dart';
import '../models/user.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://10.0.2.2:8090', // Replace with your PocketBase URL
  ));

  // Login method
  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/api/collections/users/auth-with-password',
        data: {
          "identity": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        print("Login Successful: ${response.data}");
        return response.data;
      }
    } on DioException catch (e) {
      print("DioError (Login): ${e.message}");
      print("Request Data: ${e.requestOptions.data}");
      print("Response Data: ${e.response?.data}");
      print("Status Code: ${e.response?.statusCode}");
    } catch (e) {
      print("Unexpected Error (Login): $e");
    }
    return null;
  }

  // Signup method
  Future<Map<String, dynamic>?> register(
      String email, String password, String name) async {
    try {
      final response = await _dio.post(
        '/api/collections/users/records',
        data: {
          "email": email,
          "name": name,
          "password": password,
          "passwordConfirm": password,
        },
      );
      if (response.statusCode == 200) {
        print("Signup Successful: ${response.data}");
        return response.data;
      }
    } on DioException catch (e) {
      print("DioError (SignUp): ${e.message}");
      print("Request Data: ${e.requestOptions.data}");
      print("Response Data: ${e.response?.data}");
      print("Status Code: ${e.response?.statusCode}");
    } catch (e) {
      print("Unexpected Error (SignUp): $e");
    }
    return null;
  }
}
