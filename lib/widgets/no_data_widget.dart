import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:sizer/sizer.dart';

class NoDataWidget extends StatelessWidget {
  final String title;
  final String desc;
  final double size;
  const NoDataWidget(
      {Key? key, this.title = 'No Data', this.desc = '', this.size = 300})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: Column(
          children: [
            Center(
              child: SizedBox.square(
                  dimension: size / 2,
                  child: SvgPicture.asset(context.resources.asset.noData)),
            ),
            const SpaceWidget(
              space: 16,
            ),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: context.resources.color.textBoldColor)),
            const SpaceWidget(
              space: 16,
            ),
            Text(desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.sp, color: context.resources.color.textColor)),
          ],
        ),
      ),
    );
  }
}
