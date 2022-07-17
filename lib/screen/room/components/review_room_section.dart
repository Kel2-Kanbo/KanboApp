import 'package:flutter/material.dart';
import 'package:kanbo/screen/review/all_review_screen.dart';
import 'package:kanbo/screen/review/components/item_review.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

import '../../../model/review_response.dart';

class ReviewRoomSection extends StatelessWidget {
  final ReviewResponse reviewResponse;
  final String title;
  const ReviewRoomSection(
      {Key? key, required this.reviewResponse, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    RatingWidget(
                      rating: reviewResponse.rating,
                      review: reviewResponse.review,
                    )
                  ],
                ),
              ),
              TextButton(
                  onPressed: () => AppRoute.to(AllReviewScreen(
                        title: title,
                        listReview: reviewResponse.listReview,
                      )),
                  child: const Text('View all'))
            ],
          ),
          const SpaceWidget(),
          const ItemReview()
        ],
      ),
    );
  }
}
