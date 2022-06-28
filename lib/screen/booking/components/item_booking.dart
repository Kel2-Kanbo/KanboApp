import 'package:flutter/material.dart';
import 'package:kanbo/screen/review/review_screen.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_route.dart';
import '../../../widgets/simple_location_widget.dart';
import '../../../widgets/space_widget.dart';

class ItemBooking extends StatelessWidget {
  final String text;
  const ItemBooking({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = [
      Text(
        'Room $text',
        style: TextStyle(
            fontSize: 14.sp,
            color: context.resources.color.textBoldColor,
            fontWeight: FontWeight.bold),
      ),
      Text(
        'Office $text',
        style: TextStyle(
          fontSize: 12.sp,
          color: context.resources.color.textBoldColor,
        ),
      ),
      SimpleLocationWidget(text: text),
      Text(
        '$text Days',
        style: TextStyle(
          fontSize: 12.sp,
          color: context.resources.color.colorPrimary,
        ),
      )
    ];
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Booked date : $text',
              style: TextStyle(
                  fontSize: 10.sp,
                  color: context.resources.color.textBoldColor),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Flexible(
                    child: Container(
                        width: 75,
                        height: 75,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1551128997-c2b66772f982',
                          fit: BoxFit.fill,
                        ))),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => content[index],
                      separatorBuilder: (context, index) => const SpaceWidget(
                            space: 4,
                          ),
                      itemCount: content.length),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Payment :',
                      style: TextStyle(
                          color: context.resources.color.textColor,
                          fontSize: 10.sp),
                    ),
                    Text(
                      '${text}0${text}0000',
                      style: TextStyle(
                          color: context.resources.color.textBoldColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
                Expanded(
                  flex: 2,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ))),
                        onPressed: () => AppRoute.to(ReviewScreen(text: text)),
                        child: const Text('Give Review')))
              ],
            ),
          )
        ],
      ),
    );
  }
}
