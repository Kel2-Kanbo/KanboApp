import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/rating_widget.dart';
import 'package:kanbo/widgets/simple_location_widget.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:sizer/sizer.dart';

class HeaderOfficeSection extends StatelessWidget {
  final String text;
  const HeaderOfficeSection({Key? key, required this.text}) : super(key: key);

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Office $text',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: context.resources.color.textBoldColor),
                  ),
                  SimpleLocationWidget(text: 'Index $text')
                ],
              ),
              const RatingWidget()
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
              const Text(
                  'hsdklghjklsdgnjklsdngjklsdfgjkhsfklghsklgjsdfklgjskdfjgsdlg')
            ],
          )
        ],
      ),
    );
  }
}
