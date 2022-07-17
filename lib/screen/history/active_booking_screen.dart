import 'package:flutter/material.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

import '../../model/order.dart';
import 'components/item_booking.dart';

class ActiveBookingScreen extends StatelessWidget {
  const ActiveBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getListBooking(context).isEmpty
        ? const NoDataWidget(title: 'No Active Booking here',)
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemBuilder: (context, index) {
              final Order order = context.resources.list.listBooking[index];
              return ItemBooking(
                order: order,
              );
            },
            separatorBuilder: (context, index) => const SpaceWidget(),
            itemCount: context.resources.list.listBooking.length);
  }

  List<Order> getListBooking(BuildContext context) =>
      context.resources.list.listBooking;
}
