import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/rating_widget.dart';
import 'package:kanbo/widgets/star_rating_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/space_widget.dart';

class ReviewRoomSection extends StatelessWidget {
  const ReviewRoomSection({Key? key}) : super(key: key);

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
                        onPressed: () {}, child: const Text('View all'))),
              )
            ],
          ),
          const SpaceWidget(),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: context.resources.color.grey3),
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            child: FlutterLogo(),
                          ),
                          const SpaceWidget(
                            space: 8,
                            isVerticalSpace: false,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Jhon Doe',
                                style: TextStyle(
                                    color:
                                        context.resources.color.textBoldColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'DD MMMM YYYY',
                                style: TextStyle(fontSize: 10.sp),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                        child: Positioned(
                      right: 0,
                      child: StarRatingWidget(
                        rating: 1,
                      ),
                    ))
                  ],
                ),
                const SpaceWidget(
                  space: 8,
                ),
                const Text(
                  'descdescdescdescdescdescdescdescdescdescdescdesc',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
