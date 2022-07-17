import 'package:flutter/material.dart';
import 'package:kanbo/model/room.dart';
import 'package:kanbo/screen/booking/components/room_details_section.dart';
import 'package:kanbo/export_package.dart';

class HeaderConfirmSection extends StatelessWidget {
  final Room room;
  final String date;
  final int duration;
  const HeaderConfirmSection(
      {Key? key,
      required this.room,
      required this.date,
      required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoomDetailsSection(room: room),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: context.resources.color.textBoldColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(flex: 2, child: Text(date)),
                    Expanded(child: Text('$duration Days', textAlign: TextAlign.end,))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
