import 'package:flutter/material.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class ShowDateWidget extends StatelessWidget {
  final String title;
  final String content;
  const ShowDateWidget({Key? key, required this.title, this.content = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SpaceWidget(
          space: 4,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: context.resources.color.white2,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Text(content.isNotEmpty
              ? content
              : 'Choose ${title.toLowerCase()} date'),
        )
      ],
    );
  }
}
