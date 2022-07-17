import 'package:flutter/material.dart';
import 'package:kanbo/model/room.dart';
import 'package:kanbo/screen/office/available_rooms_screen.dart';
import 'package:kanbo/screen/office/components/item_room_adapter.dart';
import 'package:kanbo/export_package.dart';

class RoomOfficeSection extends StatelessWidget {
  final List<Room> listRoom;
  final String title;
  const RoomOfficeSection(
      {Key? key, required this.listRoom, required this.title})
      : super(key: key);

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
                    onPressed: () => AppRoute.to(AvailableRoomsScreen(
                          listRoom: listRoom,
                          officeName: title,
                        )),
                    child: const Text('View all'))
              ],
            ),
          ),
          SizedBox(
              height: 235,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: listRoom.length,
                itemBuilder: (context, index) {
                  final Room room = listRoom[index];
                  return ItemRoomAdapter(
                    room: room,
                  );
                },
              ))
        ],
      ),
    );
  }
}
