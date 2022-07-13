import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/rating_widget.dart';
import '../../../widgets/space_widget.dart';

class RoomDetailsSection extends StatelessWidget {
  final String text;
  const RoomDetailsSection({Key? key, this.text = '-'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Room Detail',
            style: TextStyle(
              fontSize: 16.sp,
              color: context.resources.color.textBoldColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Flexible(
                        child: Container(
                            width: 75,
                            height: 75,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1551128997-c2b66772f982',
                              fit: BoxFit.fill,
                            ))),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Room $text',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
