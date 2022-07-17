import 'package:flutter/material.dart';
import 'package:kanbo/res/custom_icons.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class SimpleLocationWidget extends StatelessWidget {
  final String address;
  const SimpleLocationWidget({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          CustomIcons.location_outline,
          size: 16,
          color: context.resources.color.grey2,
        ),
        const SpaceWidget(space: 5, isVerticalSpace: false,),
        Expanded(child: Text(address, style: TextStyle(fontSize: 10.sp),)),
      ],
    );
  }
}
