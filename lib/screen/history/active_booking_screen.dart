import 'package:flutter/material.dart';
import 'package:kanbo/widgets/space_widget.dart';

import 'components/item_booking.dart';

class ActiveBookingScreen extends StatelessWidget {
  const ActiveBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemBuilder: (context, index) => ItemBooking(text: index.toString()),
        separatorBuilder: (context, index) => const SpaceWidget(),
        itemCount: 10);
  }
}
