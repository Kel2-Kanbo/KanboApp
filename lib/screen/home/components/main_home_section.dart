import 'package:flutter/material.dart';
import 'package:kanbo/model/office.dart';
import 'package:kanbo/screen/home/components/item_office_adapter.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class MainHomeSection extends StatelessWidget {
  final List<Office> listOffice;
  const MainHomeSection({Key? key, required this.listOffice}) : super(key: key);

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
              var isLandscape =
                  orientation == Orientation.landscape || size.width > 500;
              return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  itemCount: listOffice.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      crossAxisCount: !isLandscape ? 2 : 3,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    final Office office = listOffice[index];
                    return ItemOfficeAdapter(
                      office: office,
                    );
                  });
            },
          ),
        )
      ],
    );
  }
}
