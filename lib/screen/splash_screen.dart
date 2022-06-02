import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanbo/res/app_context_ext.dart';

import '../utils/app_route.dart';
import 'login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
    ]);
    _initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.resources.color.colorPrimary,
        body: SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Center(
        child: SvgPicture.asset(context.resources.asset.appLogo, color: Colors.white,),
      ),
    ));
  }

  void _initialize() async {
    Timer(const Duration(seconds: 3), () {
      AppRoute.clearTopTo(const LoginScreen());
    });
  }
}
