import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:sizer/sizer.dart';

import '../screen/home/components/item_office_adapter.dart';

class RecomendOfficeSection extends StatelessWidget {
  const RecomendOfficeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceWidget(
          space: 2.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Recommendation',
              style: TextStyle(
                fontSize: 16.sp,
                color: context.resources.color.textBoldColor,
              )),
        ),
        const SpaceWidget(
          space: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Our best picks for you',
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
        const SpaceWidget(
          space: 5,
        ),
        SizedBox(
            width: size.width,
            height: 225,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) =>
                  ItemOfficeAdapter(text: '$index'),
            ))
      ],
    );
  }
}
