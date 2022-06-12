import 'package:flutter/material.dart';
import 'package:kanbo/res/custom_icons.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/space_widget.dart';

class SimpleLocationWidget extends StatelessWidget {
  final String text;
  const SimpleLocationWidget({Key? key, required this.text}) : super(key: key);

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
        Text(text),
      ],
    );
  }
}
