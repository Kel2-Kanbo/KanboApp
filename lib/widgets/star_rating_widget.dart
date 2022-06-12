import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';

class StarRatingWidget extends StatelessWidget {
  final int starCount;
  final int rating;
  const StarRatingWidget({Key? key, this.starCount = 5, this.rating = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          starCount,
          (index) => Icon(
                Icons.star,
                color: index + 1 <= getRating() ? context.resources.color.yellow : Colors.grey[300],
                size: 14,
              )),
    );
  }
  
  int getRating() => rating > starCount ? starCount : rating;
}
