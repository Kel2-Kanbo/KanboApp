import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/screen/office/components/item_room_adapter.dart';

import '../../model/room.dart';

class AvailableRoomsScreen extends StatelessWidget {
  final String officeName;
  final List<Room> listRoom;
  const AvailableRoomsScreen(
      {Key? key, required this.listRoom, required this.officeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          officeName,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: listRoom.length,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemBuilder: (context, index) {
            final Room room = listRoom[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: ItemRoomAdapter(
                room: room,
              ),
            );
          }),
    );
  }
}
