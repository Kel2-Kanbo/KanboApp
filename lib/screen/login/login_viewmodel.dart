import 'package:flutter/cupertino.dart';
import 'package:kanbo/data/remote/auth_repository.dart';
import 'package:kanbo/data/remote/viewstate.dart';
import 'package:kanbo/model/dio_response.dart';
import 'package:kanbo/res/strings/global_string_src.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepositoryImpl();

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  User _user = User();
  User get user => _user;

  String? _message;
  String? get message => _message;

  String? _errorMsg;
  String? get errorMsg => _errorMsg;

  _changeState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  void setLogin(User user) async {
    _changeState(ViewState.loading);
    DioResponse<User> response = await _authRepository.setSignIn(user);
    var responseUser = response.data;
    if (responseUser != null) {
      _user = responseUser;
      _saveUser(userToJson(responseUser));
      _changeState(ViewState.success);
    }
    if (response.errorMessage != null) {
      _changeState(ViewState.error);
      _errorMsg = response.errorMessage;
    }
  }

  void setLogOut() async {
    _changeState(ViewState.loading);
    DioResponse<String> response = await _authRepository.setSignOut();
    var responseUser = response.data;
    var sharedPref = await SharedPreferences.getInstance();
    if (responseUser != null) {
      _message = responseUser;
      sharedPref.remove(SharedPref.isLogin);
      sharedPref.remove(SharedPref.user);
      _changeState(ViewState.success);
    }
    if (response.errorMessage != null) {
      _changeState(ViewState.error);
      _errorMsg = response.errorMessage;
    }
  }

  void _saveUser(String user) async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(SharedPref.isLogin, true);
    sharedPref.setString(SharedPref.user, user);
  }

  void reset() {
    _changeState(ViewState.none);
  }
}
