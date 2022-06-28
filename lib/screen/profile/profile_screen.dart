import 'package:flutter/material.dart';
import 'package:kanbo/screen/login/login_viewmodel.dart';
import 'package:kanbo/screen/login/login_screen.dart';
import 'package:kanbo/screen/profile/components/header_profile_section.dart';
import 'package:kanbo/screen/profile/components/logout_profile_section.dart';
import 'package:kanbo/screen/profile/components/main_profile_section.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/utils/app_route.dart';
import 'package:kanbo/utils/snackbar.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user.dart';
import '../../res/strings/global_string_src.dart';
import '../../widgets/state_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late LoginViewModel _viewModel;
  User user = User();

  @override
  void initState() {
    _viewModel = context.read<LoginViewModel>()..reset();
    _initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var listSection = getProfileSection();
    return Scaffold(
      backgroundColor: context.resources.color.white2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) => StateWidget(
          state: viewModel.state,
          onSucces: (_) {
            context.snackbar.normal(viewModel.message ?? 'Kamu telah keluar');
            AppRoute.clearAll(const LoginScreen());
          },
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(24))),
              ),
              ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => listSection[index],
                  separatorBuilder: (context, index) => const SpaceWidget(
                        space: 40,
                      ),
                  itemCount: listSection.length)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getProfileSection() => [
        HeaderProfileSection(
          user: user,
        ),
        const MainProfileSection(),
        const LogoutProfileSection()
      ];

  void _initialize() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences.getString(SharedPref.user);
    setState(() {
      this.user = user != null ? userFromJson(user) : User();
    });
  }
}
