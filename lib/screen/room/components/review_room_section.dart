import 'package:flutter/material.dart';
import 'package:kanbo/screen/review/all_review_screen.dart';
import 'package:kanbo/screen/review/components/item_review.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/rating_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_route.dart';
import '../../../widgets/space_widget.dart';

class ReviewRoomSection extends StatelessWidget {
  final String text;
  const ReviewRoomSection({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Review',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: context.resources.color.textBoldColor)),
                    const SpaceWidget(
                      space: 8,
                    ),
                    const RatingWidget()
                  ],
                ),
              ),
              Expanded(
                child: Positioned(
                    right: 0,
                    child: TextButton(
                        onPressed: () => AppRoute.to(AllReviewScreen(text: text)), child: const Text('View all'))),
              )
            ],
          ),
          const SpaceWidget(),
          const ItemReview()
        ],
      ),
    );
  }
}
