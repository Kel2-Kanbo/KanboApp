import 'package:flutter/material.dart';
import 'package:kanbo/screen/review/components/item_review.dart';

import '../../utils/app_route.dart';

class AllReviewScreen extends StatelessWidget {
  final String text;
  const AllReviewScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Review Room $text',
          style: const TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () => AppRoute.back(),
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 10,
        itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: ItemReview(),
        );
      }),
    );
  }
}
