import 'package:dio/dio.dart';

class DioClient {
  static Dio init() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/',
        
      ),
    );
  }
}