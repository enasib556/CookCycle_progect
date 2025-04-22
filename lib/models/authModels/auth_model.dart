import 'package:university_graduate_project/models/authModels/user_model.dart';

class AuthResponse {
  final bool success;
  final String message;
  final String? token;
  final UserModel? user;

  AuthResponse({
    required this.success,
    required this.message,
    this.token,
    this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'],
      message: json['message'],
      token: json['token'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }
}
