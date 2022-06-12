import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/space_widget.dart';

class SpecRoomSection extends StatelessWidget {
  const SpecRoomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listFac = [
      'Free Wifiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii',
      'Listrik kantor',
      'OB',
      'Free AER',
      'DLL'
    ];
    var listSpec = [
      '3 Orang',
      '48 sqm',
      'Office Table',
    ];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 24,
        children: [
          Expanded(
              child: Column(
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
                itemCount: listSpec.length,
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
                            listSpec[index],
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          )),
          const SpaceWidget(),
          Expanded(
              child: Column(
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
                itemCount: listFac.length,
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
                          listFac[index],
                          style: const TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
