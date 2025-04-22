import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/authModels/auth_model.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(AuthInitialState());

  String _parseError(dynamic body) {
    if (body is Map) {
      if (body.containsKey("errors")) {
        final errors = body["errors"];
        if (errors is List && errors.isNotEmpty && errors[0]["msg"] is String) {
          return errors[0]["msg"];
        }
      }
      if (body.containsKey("message") && body["message"] is String) {
        return body["message"];
      }
    }
    return "An unknown error occurred.";
  }

  void register({
    required String userName,
    required String email,
    required String password,
    required String confirmPass,
    required String phone,
    required String gender,
  }) async {
    if (userName.isEmpty || email.isEmpty || password.isEmpty || confirmPass.isEmpty || phone.isEmpty || gender.isEmpty) {
      emit(FailedToRegisterState(errorMessage: "All fields must be filled out"));
      return;
    }

    emit(RegisterLoadingState());

    try {
      final response = await http.post(
        Uri.parse("http://172.16.16.9:3000/api/users/register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "username": userName.trim(),
          "email": email.trim(),
          "password": password,
          "confirmPass": confirmPass,
          "phone": phone.trim(),
          "gender": gender.toLowerCase(),
        }),
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 && responseBody["success"] == true) {
        final authResponse = AuthResponse.fromJson(responseBody);

        // تخزين البيانات في SharedPreferences بعد التسجيل
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", authResponse.token ?? '');
        await prefs.setInt("userId", authResponse.user?.customerId ?? 0);
        await prefs.setString("username", authResponse.user?.username ?? '');
        await prefs.setString("email", authResponse.user?.email ?? '');
        await prefs.setString("gender", authResponse.user?.gender ?? '');

        // يمكن إضافة بيانات أخرى مثل رقم الهاتف هنا إذا أردت

        print("✅ Token: ${authResponse.token}");
        print("👤 User: ${authResponse.user?.username}");

        emit(RegisterSuccessState());
      } else {
        final errorMsg = _parseError(responseBody);
        emit(FailedToRegisterState(errorMessage: errorMsg));
      }
    } catch (e) {
      emit(FailedToRegisterState(errorMessage: "An error occurred: ${e.toString()}"));
    }
  }
}
