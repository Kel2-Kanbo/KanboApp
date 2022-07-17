import 'package:flutter/material.dart';
import 'package:kanbo/model/review.dart';
import 'package:kanbo/screen/review/components/item_review.dart';
import 'package:kanbo/export_package.dart';

class AllReviewScreen extends StatelessWidget {
  final String title;
  final List<Review> listReview;
  const AllReviewScreen(
      {Key? key, required this.title, required this.listReview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Review $title',
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
