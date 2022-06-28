import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kanbo/screen/review/components/item_add_review_section.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:sizer/sizer.dart';

class ReviewScreen extends StatefulWidget {
  final String text;
  const ReviewScreen({Key? key, required this.text}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final TextEditingController _reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Review',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ItemAddReviewSection(text: widget.text),
          ),
          Divider(
            thickness: 5,
            color: context.resources.color.white2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Center(
              child: RatingBar(
                  initialRating: 3,
                  minRating: 1,
                  allowHalfRating: true,
                  ratingWidget: RatingWidget(
                      full: Icon(
                        Icons.star,
                        color: context.resources.color.yellow,
                      ),
                      half: Icon(
                        Icons.star_half,
                        color: context.resources.color.yellow,
                      ),
                      empty: Icon(Icons.star,
                          color: context.resources.color.grey3)),
                  onRatingUpdate: (double rating) =>
                      setState(() {
                        _reviewController.text = 'Your rating $rating';
                      })),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("What makes you satisfied?",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: context.resources.color.textBoldColor,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 18),
            child: TextField(
              controller: _reviewController,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "Write a review",
                  filled: true,
                  fillColor: context.resources.color.white2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ))),
                  onPressed: () {},
                  child: const Text('Post')),
            ),
          )
        ],
      ),
    );
  }
}
