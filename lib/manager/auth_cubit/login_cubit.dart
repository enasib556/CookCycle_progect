import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../models/authModels/auth_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> login({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      emit(LoginFailedState(errorMessage: "Both fields must be filled out"));
      return;
    }

    emit(LoginLoadingState());

    try {
      final response = await http.post(
        Uri.parse("http://172.16.16.9:3000/api/users/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email.trim(),
          "password": password,
        }),
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 && responseBody["success"] == true) {
        final authResponse = AuthResponse.fromJson(responseBody);

        // تخزين البيانات في SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", authResponse.token ?? '');
        await prefs.setInt("userId", authResponse.user?.customerId ?? 0);
        await prefs.setString("username", authResponse.user?.username ?? '');
        await prefs.setString("email", authResponse.user?.email ?? '');
        await prefs.setString("gender", authResponse.user?.gender ?? '');
        await prefs.setString("phone", authResponse.user?.phone ?? '');


        emit(LoginSuccessState(authResponse: authResponse));
      } else {
        emit(LoginFailedState(errorMessage: responseBody['message'] ?? 'Login failed.'));
      }
    } catch (e) {
      emit(LoginFailedState(errorMessage: "An error occurred: ${e.toString()}"));
    }
  }
}
