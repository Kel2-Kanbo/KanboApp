import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/rating_widget.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:sizer/sizer.dart';

class ItemAddReviewSection extends StatelessWidget {
  final String text;
  const ItemAddReviewSection({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Container(
                width: 75,
                height: 75,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Image.network(
                  'https://images.unsplash.com/photo-1551128997-c2b66772f982',
                  fit: BoxFit.fill,
                ))),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text('Room $text',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: context.resources.color.textBoldColor,
                  )),
              const SpaceWidget(
                space: 4,
              ),
              Text(
                'Building $text',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: context.resources.color.textBoldColor,
                ),
              ),
              const SpaceWidget(
                space: 4,
              ),
              RatingWidget(
                review: text,
              )
          ],
        ),
            ))
      ],
    );
  }
}
