import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/screen/home/components/header_home_section.dart';
import 'package:kanbo/screen/home/components/main_home_section.dart';
import 'package:kanbo/widgets/recomend_office_section.dart';
import 'package:kanbo/widgets/space_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: context.resources.color.colorPrimary,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        body: ListView(
          children: [
            const HeaderHomeSection(),
            const RecomendOfficeSection(),
            const SpaceWidget(),
            Divider(
              thickness: 5,
              color: context.resources.color.white2,
            ),
            const MainHomeSection(),
            const SpaceWidget()
          ],
        ),
      ),
    );
  }
}
