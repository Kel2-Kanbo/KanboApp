import 'package:flutter/material.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

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
            height: 250,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: context.resources.list.listOffice.length,
              itemBuilder: (context, index) {
                final office = context.resources.list.listOffice[index];
                return ItemOfficeAdapter(
                  office: office,
                );
              },
            ))
      ],
    );
  }
}
