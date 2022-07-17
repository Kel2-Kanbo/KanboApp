import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanbo/screen/login/login_screen.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class SentMailScreen extends StatelessWidget {
  final String? email;
  const SentMailScreen({Key? key, this.email = '-'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            bottom: 8.h,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  Text(
                    'Did not receive the email? Check your spam folder or',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11.sp),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Resend email',
                          style: TextStyle(
                              color: context.resources.color.textBoldColor,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ])),
          ),
          Positioned(
            top: 10.h,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'Verify your email',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: context.resources.color.textBoldColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox.square(
                      dimension: 130,
                      child:
                          SvgPicture.asset(context.resources.asset.mailSent)),
                  SizedBox(
                    height: 4.h,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: context.resources.color.textColor),
                          children: [
                            const TextSpan(
                              text: 'Your entered ',
                            ),
                            TextSpan(
                                text: email,
                                style: TextStyle(
                                    color:
                                        context.resources.color.textBoldColor,
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(
                              text:
                                  ' as the email address for your account. You will need to verify you email to complete registration',
                            )
                          ])),
                  SizedBox(
                    height: 4.h,
                  ),
                  DefaultButtonWidget('Open email app', onPressed: () {
                    //_openEmailApp(context);
                    AppRoute.clearAll(const LoginScreen());
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _openEmailApp(BuildContext context) async {
    var result = await OpenMailApp.openMailApp();

    if (!result.didOpen && !result.canOpen) {
      await launchUrl(Uri.parse('https://mail.google.com/mail/'));
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: context,
        builder: (_) {
          return MailAppPickerDialog(
            mailApps: result.options,
          );
        },
      );
    }
  }
}
