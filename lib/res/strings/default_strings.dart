import 'strings.dart';

class DefaultStrings extends Strings {
  @override
  String get appName => 'Kanbo';

  @override
  String get appVersions => '0.0.1';

  @override
  String get password => 'Password';

  @override
  String get tidakBolehKosong => 'Can not be empty';

  @override
  String get username => 'Username';

  @override
  String get submit => 'Submit';

  @override
  String get passwordTidakSama => 'Password must be the same';

  @override
  String get haveAccount => 'Have an account?';

  @override
  String get dontHaveAccount => 'Dont have an account?';
}
