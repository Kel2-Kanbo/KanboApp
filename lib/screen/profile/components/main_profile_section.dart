import 'package:flutter/material.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class MainProfileSection extends StatelessWidget {
  const MainProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listProfile = context.resources.list.listProfile;
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var profile = listProfile[index];
          return Container(
            height: 55,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(profile.title,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: context.resources.color.textBoldColor)),
                const Icon(Icons.chevron_right)
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SpaceWidget(space: 16),
        itemCount: listProfile.length);
  }
}
