import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:sizer/sizer.dart';

class ItemNearbyPlace extends StatelessWidget {
  final String text;
  const ItemNearbyPlace({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nearby Places $text',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: context.resources.color.textBoldColor),
              ),
              const SpaceWidget(
                space: 2,
              ),
              Text(
                '$text Km ($text min)',
                style: TextStyle(
                    fontSize: 10.sp, color: context.resources.color.grey2),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'Index $text',
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 12.sp, color: context.resources.color.textBoldColor),
          ),
        )
      ],
    );
  }
}
