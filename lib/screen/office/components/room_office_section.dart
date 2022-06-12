import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/screen/office/available_rooms_screen.dart';
import 'package:kanbo/screen/office/components/item_room_adapter.dart';
import 'package:kanbo/utils/app_route.dart';
import 'package:sizer/sizer.dart';

class RoomOfficeSection extends StatelessWidget {
  final String text;
  const RoomOfficeSection({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.resources.color.white2,
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Available rooms',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: context.resources.color.textBoldColor)),
                TextButton(
                    onPressed: () => AppRoute.to(AvailableRoomsScreen(text: text,)),
                    child: const Text('View all'))
              ],
            ),
          ),
          SizedBox(
              height: 235,
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => ItemRoomAdapter(
                  text: '$index',
                ),
              ))
        ],
      ),
    );
  }
}
