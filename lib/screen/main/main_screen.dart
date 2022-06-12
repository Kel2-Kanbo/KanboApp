import 'package:flutter/material.dart';
import 'package:kanbo/res/custom_icons.dart';
import 'package:kanbo/utils/app_context_ext.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.resources.list.mainScreens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.white,
            labelTextStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: context.resources.color.textBoldColor))),
        child: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
                icon: Icon(CustomIcons.home_outline),
                selectedIcon: Icon(CustomIcons.home),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(CustomIcons.clipboard_alt_outline),
                selectedIcon: Icon(CustomIcons.clipboard_alt),
                label: 'Booking'),
            NavigationDestination(
                icon: Icon(CustomIcons.envelope_outline),
                selectedIcon: Icon(CustomIcons.envelope),
                label: 'Chat'),
            NavigationDestination(
                icon: Icon(CustomIcons.user_outline),
                selectedIcon: Icon(CustomIcons.user),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
