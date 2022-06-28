import 'package:dio/dio.dart';
import 'package:kanbo/model/dio_response.dart';
import 'package:kanbo/res/strings/global_string_src.dart';

import '../../model/user.dart';

abstract class AuthRepository {
  Future<DioResponse<String>> setSignUp(User user);
  Future<DioResponse<User>> setSignIn(User user);
  Future<DioResponse<String>> setSignOut();
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<DioResponse<User>> setSignIn(User user) async {
    DioResponse<User> dioResponse = DioResponse();
    try {
      Response<String> response = await _dio()
          .post(_getPath(ApiEndPoints.signIn), data: user.toJsonLogin());
      var responseData = response.data;
      dioResponse.data =
          responseData != null ? userFromJson(responseData) : null;
      dioResponse.errorMessage = null;
    } on DioError catch (e) {
      dioResponse.data = null;
      dioResponse.errorMessage = e.response?.statusCode == 401
          ? 'Email atau password tidak sesuai'
          : 'Terjadi kesalahan';
    }
    return dioResponse;
  }

  @override
  Future<DioResponse<String>> setSignOut() async {
    DioResponse<String> dioResponse = DioResponse();
    try {
      Response<Map<String, dynamic>> response;
      response = await _dio().post(_getPath(ApiEndPoints.signOut));
      var responseData = response.data!['message'];
      dioResponse.data = responseData;
      dioResponse.errorMessage = null;
    } on DioError catch (e) {
      dioResponse.data = null;
      dioResponse.errorMessage = e.response?.statusCode == 401
          ? 'Unauthorized'
          : 'Terjadi kesalahan';
    }
    return dioResponse;
  }

  @override
  Future<DioResponse<String>> setSignUp(User user) async {
    DioResponse<String> dioResponse = DioResponse();
    try {
      Response<Map<String, dynamic>> response;
      response = await _dio().post(_getPath(ApiEndPoints.signUp), data: user.toJsonRegister());
      var responseData = response.data!['message'];
      dioResponse.data = responseData;
      dioResponse.errorMessage = null;
    } on DioError catch (e) {
      dioResponse.data = null;
      dioResponse.errorMessage = e.response?.statusCode == 400
          ? e.response?.data['message']
          : 'Terjadi kesalahan';
    }
    return dioResponse;
  }

  String _getPath(String endPoint) => '/${ApiEndPoints.auth}/$endPoint';

  Dio _dio() {
    var options = BaseOptions(
        baseUrl: baseApi,
        connectTimeout: 5000,
        receiveTimeout: 10000,
        contentType: 'application/json',
        responseType: ResponseType.json);
    return Dio(options);
  }
}
