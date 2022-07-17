import 'package:flutter/material.dart';
import 'package:kanbo/screen/room/detail_room_screen.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

import '../../../model/room.dart';
import '../../../utils/currency_format.dart';

class ItemRoomAdapter extends StatelessWidget {
  final Room room;
  const ItemRoomAdapter({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return SizedBox(
      width: 250,
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () => AppRoute.to(DetailRoomScreen(room: room,)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
                height: 125,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    room.thumbnails[0],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        room.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: context.resources.color.textBoldColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    RatingWidget(
                      rating: room.review.rating,
                      review: room.review.review,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: CurrencyFormat.convertToIdr(room.pricePerDay),
                      style: TextStyle(
                          color: context.resources.color.colorPrimary,
                          fontSize: 12.sp)),
                  TextSpan(text: ' /day', style: TextStyle(fontSize: 10.sp))
                ])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  room.facilities.join(' • '),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
