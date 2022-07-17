import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kanbo/export_package.dart';
import 'package:kanbo/screen/login/login_viewmodel.dart';
import 'package:kanbo/screen/splash_screen.dart';
import 'package:kanbo/viewmodel/language_viewmodel.dart';
import 'package:provider/provider.dart';

import 'screen/register/register_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LanguageViewModel()),
        ChangeNotifierProvider.value(value: RegisterViewModel()),
        ChangeNotifierProvider.value(value: LoginViewModel()),
      ],
      child: Selector<LanguageViewModel, Locale>(
        selector: (context, viewmodel) => viewmodel.language,
        builder: (context, locale, child) => Sizer(
          builder: (BuildContext context, Orientation orientation,
                  DeviceType deviceType) =>
              MaterialApp(
            title: context.resources.string.appName,
            navigatorKey: AppRoute.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: context.resources.color.colorPrimary,
                scaffoldBackgroundColor: Colors.white,
                fontFamily: 'Rubik',
                textTheme: Theme.of(context).textTheme.apply(
                      bodyColor: context.resources.color.textColor,
                    )),
            locale: locale,
            supportedLocales: const [
              Locale('en', 'EN'),
              Locale('id', 'ID'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              FormBuilderLocalizations.delegate,
            ],
            home: const SplashScreen(),
          ),
        ),
      ),
    );
  }
}
