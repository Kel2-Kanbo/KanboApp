
import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/screen/home/components/item_office_adapter.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/space_widget.dart';

class MainHomeSection extends StatelessWidget {
  const MainHomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('For You',
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
            'Find the most comfortable place to work',
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
        const SpaceWidget(
          space: 5,
        ),
        SizedBox(
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              var isLandscape = orientation == Orientation.landscape || size.width > 500;
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      crossAxisCount:
                          !isLandscape ? 2 : 3,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) => ItemOfficeAdapter(
                        text: '$index',
                      ));
            },
          ),
        )
      ],
    );
  }
}
