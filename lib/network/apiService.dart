import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  static const baseUrl = 'http://172.16.16.9:3000/api/';
  Future<Response> get(String endpoint) => dio.get(baseUrl + endpoint);
}
