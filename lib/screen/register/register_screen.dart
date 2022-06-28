import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kanbo/screen/register/register_viewmodel.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/screen/register/components/register_form_widget.dart';
import 'package:kanbo/screen/sentmail/sent_mail_screen.dart';
import 'package:kanbo/utils/snackbar.dart';
import 'package:kanbo/widgets/default_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../model/user.dart';
import '../../utils/app_route.dart';
import '../../widgets/space_widget.dart';
import '../../widgets/state_widget.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late RegisterViewModel _viewModel;
  String _email = '';

  @override
  void initState() {
    _viewModel = context.read<RegisterViewModel>()..reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: context
                                              .resources.color.textBoldColor),
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
            Consumer<RegisterViewModel>(
                builder: (context, viewmodel, child) => StateWidget(
                      state: viewmodel.state,
                      onError: (timeStamp) {
                        var errorMsg = viewmodel.errorMsg;
                        if (errorMsg != null) {
                          context.snackbar.error(errorMsg);
                        }
                      },
                      onSucces: (timeStamp) {
                        var message = viewmodel.message;
                        if (message != null) {
                          context.snackbar.normal(message);
                        }
                        AppRoute.clearAll(SentMailScreen(
                          email: _email,
                        ));
                        _formKey.currentState?.reset();
                      },
                    ))
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
      var email = _formKey.currentState?.value['email'];
      User user = User(username: username, email: email, password: password);
      _email = email.toString();
      _viewModel.setRegister(user);
    }
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
