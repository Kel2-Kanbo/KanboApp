import 'package:flutter/material.dart';
import 'package:kanbo/model/room.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class ItemAddReviewSection extends StatelessWidget {
  final Room room;
  const ItemAddReviewSection({Key? key, required this.room}) : super(key: key);

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
                  room.thumbnails[0],
                  fit: BoxFit.fill,
                ))),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(room.title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: context.resources.color.textBoldColor,
                  )),
              const SpaceWidget(
                space: 4,
              ),
              Text(
                context.resources.list.listOffice[room.officeId].title,
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
    );
  }
}
