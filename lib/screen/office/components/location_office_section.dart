import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:sizer/sizer.dart';
import 'package:latlong2/latlong.dart' as lat_lng;

import '../../../widgets/space_widget.dart';

class LocationOfficeSection extends StatelessWidget {
  const LocationOfficeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: context.resources.color.textBoldColor)),
              const SpaceWidget(
                space: 8,
              ),
              const Text(
                  'hsdklghjklsdgnjklsdngjklsdfgjkhsfklghsklgjsdfklgjskdfjgsdlg')
            ],
          )),
          Expanded(
              flex: 2,
              child: Container(
                height: 250,
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: FlutterMap(
                      options: MapOptions(
                        center: lat_lng.LatLng(-6.200000, 106.816666),
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],
                        ),
                      ]),
                ),
              )),
          Expanded(
              child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: context.resources.color.grey3,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Nearby facilities'),
                    Icon(
                      Icons.chevron_right,
                      color: context.resources.color.textColor,
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
