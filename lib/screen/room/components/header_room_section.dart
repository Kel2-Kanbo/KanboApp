import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/rating_widget.dart';
import '../../../widgets/space_widget.dart';

class HeaderRoomSection extends StatelessWidget {
  final String text;
  const HeaderRoomSection({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Room $text',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: context.resources.color.textBoldColor),
                  ),
                ),
                const Flexible(
                    child: Positioned(right: 0, child: RatingWidget()))
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
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
            ),
          )
        ],
      ),
    );
  }
}
