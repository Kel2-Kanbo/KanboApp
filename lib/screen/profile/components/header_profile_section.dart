import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanbo/model/user.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:sizer/sizer.dart';

class HeaderProfileSection extends StatelessWidget {
  final User user;
  const HeaderProfileSection({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: context.resources.color.colorPrimary,
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Stack(
        children: [
          Positioned(
              right: 0,
              top: 0,
              child: SvgPicture.asset(context.resources.asset.ellipse3)),
          Positioned(
              bottom: 0,
              left: 0,
              child: SvgPicture.asset(context.resources.asset.ellipse4)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.username,
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                ),
                Text(
                  user.email,
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
