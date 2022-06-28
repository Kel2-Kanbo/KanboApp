import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/utils/app_route.dart';
import 'package:sizer/sizer.dart';

class LogoutProfileSection extends StatelessWidget {
  const LogoutProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = context.mediaSize;
    return GestureDetector(
      onTap: () => showDialogLogOut(context),
      child: Container(
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Center(
            child: Text(
          'Log Out'.toUpperCase(),
          style: TextStyle(color: Colors.red, fontSize: 14.sp),
        )),
      ),
    );
  }

  void showDialogLogOut(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: const Text('Do you want to log out?',),
            content: const Text(
                'You still can enjoy Kanbo but you will miss a lot of exiting thing'),
            actions: [
              TextButton(onPressed: () {}, child: Text('Yes'.toUpperCase())),
              TextButton(onPressed: () => AppRoute.back(), child: Text('No'.toUpperCase()))
            ],
          ));
}
