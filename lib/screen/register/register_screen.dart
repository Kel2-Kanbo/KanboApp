import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/screen/register/components/register_form_widget.dart';
import 'package:kanbo/screen/sentmail/sent_mail_screen.dart';
import 'package:kanbo/widgets/default_button_widget.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_route.dart';
import '../../widgets/space_widget.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SvgPicture.asset(
              context.resources.asset.backgroundOffice,
              fit: BoxFit.fitWidth,
            ),
            Column(
              children: [
                Expanded(
                  child: SvgPicture.asset(context.resources.asset.appLogo),
                ),
                Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: FormBuilder(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const RegisterFormWidget(),
                                DefaultButtonWidget('Register',
                                    onPressed: () => _onRegisterClick()),
                                SpaceWidget(
                                  space: 6.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      context.resources.string.haveAccount,
                                      style: TextStyle(fontSize: 12.sp, color: context.resources.color
                                                  .textBoldColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: GestureDetector(
                                          onTap: () {
                                            _formKey.currentState?.reset();
                                            AppRoute.to(const LoginScreen());
                                          },
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff4C35E0)),
                                          )),
                                    )
                                  ],
                                ),
                                SpaceWidget(
                                  space: 6.h,
                                ),
                              ],
                            )),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  _onRegisterClick() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var username = _formKey.currentState?.value['username'];
      var password = _formKey.currentState?.value['password'];
      var email = _formKey.currentState?.value['email'].toString();
      _formKey.currentState?.reset();
      AppRoute.clearAll(SentMailScreen(
        email: email,
      ));
    }
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
