import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class SpecRoomSection extends StatelessWidget {
  final List<String> facilities;
  const SpecRoomSection({Key? key, required this.facilities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 24,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Specification',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: context.resources.color.textBoldColor)),
              const SpaceWidget(
                space: 8,
              ),
              ListView.builder(
                itemCount: getListSpec().length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '- Title',
                            ),
                            Text(
                              ':',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            getListSpec()[index],
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
          const SpaceWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Facilities',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: context.resources.color.textBoldColor)),
              const SpaceWidget(
                space: 8,
              ),
              MasonryGridView.count(
                itemCount: facilities.length,
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '- ',
                      ),
                      Expanded(
                        flex: 10,
                        child: Text(
                          facilities[index],
                          style: const TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  List<String> getListSpec() => [
        '3 Orang',
        '48 sqm',
        'Office Table',
      ];
}
