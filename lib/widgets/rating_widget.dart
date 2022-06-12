import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:sizer/sizer.dart';

class RatingWidget extends StatelessWidget {
  final double? rating;
  final String? review;
  const RatingWidget({Key? key, this.rating = 0, this.review = '- review'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: context.resources.color.yellow,
          size: 14,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(text: ' $rating', style: TextStyle(fontSize: 12.sp)),
          TextSpan(
              text: ' ($review)',
              style: TextStyle(
                  color: context.resources.color.grey2, fontSize: 10.sp))
        ])),
      ],
    );
  }
}
