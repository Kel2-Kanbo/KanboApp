import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanbo/res/app_context_ext.dart';
import 'package:kanbo/screen/login/components/login_form_widget.dart';
import 'package:kanbo/screen/register/register_screen.dart';
import 'package:kanbo/utils/app_route.dart';
import 'package:kanbo/widgets/default_button_widget.dart';
import 'package:sizer/sizer.dart';

import '../homescreen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: size.width,
                child:
                    SvgPicture.asset(context.resources.asset.backgroundOffice)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(context.resources.asset.appLogo),
                FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LoginFormWidget(),
                        DefaultButtonWidget('Login',
                            onPressed: () => _onLoginClick()),
                      ],
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.resources.string.dontHaveAccount,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: GestureDetector(
                            onTap: () {
                              _formKey.currentState?.reset();
                              AppRoute.to(const RegisterScreen());
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff4C35E0)),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _onLoginClick() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var username = _formKey.currentState?.value['username'];
      var password = _formKey.currentState?.value['password'];
      _formKey.currentState?.reset();
      AppRoute.clearAll(const HomeScreen());
    }
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
