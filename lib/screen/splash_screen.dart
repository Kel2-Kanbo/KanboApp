import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanbo/res/strings/global_string_src.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_route.dart';
import 'login/login_screen.dart';
import 'main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    _initialize();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.resources.color.colorPrimary,
        body: Center(
          child: SvgPicture.asset(
            context.resources.asset.appLogo,
            color: Colors.white,
          ),
        ));
  }

  void _initialize() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var isLogin = sharedPreferences.getBool(SharedPref.isLogin) ?? false;
    Timer(const Duration(seconds: 3), () {
      AppRoute.clearTopTo(isLogin ? const MainScreen() : const LoginScreen());
    });
  }
}
