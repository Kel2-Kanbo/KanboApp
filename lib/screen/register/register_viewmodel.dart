import 'package:flutter/cupertino.dart';
import 'package:kanbo/data/remote/auth_repository.dart';
import 'package:kanbo/data/remote/viewstate.dart';
import 'package:kanbo/model/dio_response.dart';

import '../../model/user.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepositoryImpl();

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  String? _message;
  String? get message => _message;

  String? _errorMsg;
  String? get errorMsg => _errorMsg;

  _changeState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  void setRegister(User user) async {
    _changeState(ViewState.loading);
    DioResponse<String> response = await _authRepository.setSignUp(user);
    var responseUser = response.data;
    if (responseUser != null) {
      _message = responseUser;
      _changeState(ViewState.success);
    }
    if (response.errorMessage != null) {
      _changeState(ViewState.error);
      _errorMsg = response.errorMessage;
    }
  }

  void reset() {
    _changeState(ViewState.none);
  }
}
