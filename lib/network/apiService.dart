import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  static const baseUrl = 'http://172.16.16.9:3000/api/';
  Future<Response> get(String endpoint) => dio.get(baseUrl + endpoint);
}

class ApiService2 {
  final dio = Dio();
  static const baseUrl = 'http://172.16.16.9:7000/';
  Future<Response> post(String endpoint, Map<String, dynamic> data) => dio.post(baseUrl + endpoint, data: data);
}
