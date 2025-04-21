import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:university_graduate_project/manager/auth_cubit/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  String _parseError(dynamic body) {
    if (body is Map) {
      if (body.containsKey("message") && body["message"] is String) {
        return body["message"];
      }
    }
    return "An unknown error occurred.";
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
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
        final token = responseBody["token"];
        final user = responseBody["user"];

        // خزّن التوكن في SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token);
        await prefs.setInt("userId", user["CustomerId"]);
        await prefs.setString("username", user["Username"]);
        await prefs.setString("email", user["Email"]);

        emit(LoginSuccessState());
      } else {
        final errorMsg = _parseError(responseBody);
        emit(LoginFailedState(errorMessage: errorMsg));
      }
    } catch (e) {
      emit(LoginFailedState(errorMessage: "An error occurred: ${e.toString()}"));
    }
  }
}
