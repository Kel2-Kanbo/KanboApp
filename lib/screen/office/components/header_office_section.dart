import 'package:flutter/material.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

import '../../../model/office.dart';

class HeaderOfficeSection extends StatelessWidget {
  final Office office;
  const HeaderOfficeSection({Key? key, required this.office}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      office.title,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: context.resources.color.textBoldColor),
                    ),
                    SimpleLocationWidget(
                      address: office.address,
                    )
                  ],
                ),
              ),
              RatingWidget(
                rating: office.rating,
                review: office.review,
              )
            ],
          ),
          const Divider(
            thickness: 0.5,
          ),
          const SpaceWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: context.resources.color.textBoldColor)),
              const SpaceWidget(
                space: 8,
              ),
              Text(office.description)
            ],
          )
        ],
      ),
    );
  }
}
