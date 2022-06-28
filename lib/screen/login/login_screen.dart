import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanbo/model/user.dart';
import 'package:kanbo/screen/login/login_viewmodel.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/screen/login/components/login_form_widget.dart';
import 'package:kanbo/screen/register/register_screen.dart';
import 'package:kanbo/utils/app_route.dart';
import 'package:kanbo/utils/snackbar.dart';
import 'package:kanbo/widgets/default_button_widget.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/state_widget.dart';
import '../main/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    context.read<LoginViewModel>().reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
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
                      flex: 2,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: FormBuilder(
                            key: _formKey,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const LoginFormWidget(),
                                  DefaultButtonWidget('Login',
                                      onPressed: () => _onLoginClick()),
                                  SpaceWidget(
                                    space: 6.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          context
                                              .resources.string.dontHaveAccount,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: context.resources.color
                                                  .textBoldColor)),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: GestureDetector(
                                            onTap: () {
                                              _formKey.currentState?.reset();
                                              AppRoute.to(
                                                  const RegisterScreen());
                                            },
                                            child: const Text(
                                              'Register',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff4C35E0)),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )),
                      )),
                ],
              ),
              Consumer<LoginViewModel>(
                  builder: (context, viewmodel, child) => StateWidget(
                        state: viewmodel.state,
                        onError: (timeStamp) {
                          var errorMsg = viewmodel.errorMsg;
                          if (errorMsg != null) {
                            context.snackbar.error(errorMsg);
                          }
                        },
                        onSucces: (timeStamp) {
                          _formKey.currentState?.reset();
                          AppRoute.clearAll(const MainScreen());
                        },
                      ))
            ],
          ),
        ),
      ),
    );
  }

  _onLoginClick() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var username = _formKey.currentState?.value['email'];
      var password = _formKey.currentState?.value['password'];
      User user = User(username: username, password: password);
      context.read<LoginViewModel>().setLogin(user);
    }
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
