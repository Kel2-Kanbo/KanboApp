import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/screen/home/components/header_home_section.dart';
import 'package:kanbo/screen/home/components/main_home_section.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

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
          physics: const BouncingScrollPhysics(),
          children: [
            const HeaderHomeSection(),
            const RecomendOfficeSection(),
            const SpaceWidget(),
            Divider(
              thickness: 5,
              color: context.resources.color.white2,
            ),
            MainHomeSection(
              listOffice: context.resources.list.listOffice,
            ),
            const SpaceWidget()
          ],
        ),
      ),
    );
  }
}
