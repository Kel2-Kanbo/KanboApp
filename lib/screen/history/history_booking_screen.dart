import 'package:flutter/material.dart';
import 'package:kanbo/export_custom_widgets.dart';

class HistoryBookingScreen extends StatelessWidget {
  const HistoryBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: NoDataWidget(
        title: 'No transaction yet',
        desc: 'After book a room you can manage and see transaction here',
      ),
    );
  }
}
