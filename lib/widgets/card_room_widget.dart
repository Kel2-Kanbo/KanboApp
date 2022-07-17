import 'package:flutter/material.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

import '../model/room.dart';

class CardRoomWidget extends StatelessWidget {
  final Room room;
  const CardRoomWidget ({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Container(
                        width: 75,
                        height: 75,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.network(
                          room.thumbnails[0],
                          fit: BoxFit.fill,
                        )),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(room.title,
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
                          context
                              .resources.list.listOffice[room.officeId].title,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: context.resources.color.textBoldColor,
                          ),
                        ),
                        const SpaceWidget(
                          space: 4,
                        ),
                        RatingWidget(
                          rating: room.review.rating,
                          review: room.review.review,
                        )
                      ],
                    ),
                  ))
                ],
              ),
            );
  }
}