import 'package:flutter/material.dart';
import 'package:kanbo/model/room.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class HeaderRoomSection extends StatelessWidget {
  final Room room;
  const HeaderRoomSection({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  room.title,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: context.resources.color.textBoldColor),
                ),
                RatingWidget(
                  rating: room.review.rating,
                  review: room.review.review,
                )
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description',
                textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: context.resources.color.textBoldColor)),
                const SpaceWidget(
                  space: 8,
                ),
                Text(room.description)
              ],
            ),
          )
        ],
      ),
    );
  }
}
