import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';

import '../../../widgets/space_widget.dart';

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
