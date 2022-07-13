import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kanbo/screen/office/components/item_nearby_place.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:sizer/sizer.dart';
import 'package:latlong2/latlong.dart' as lat_lng;

import '../../../utils/app_route.dart';
import '../../../widgets/space_widget.dart';

class LocationOfficeSection extends StatelessWidget {
  final String text;
  const LocationOfficeSection({Key? key, required this.text}) : super(key: key);

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
            onTap: () => showNearbyPlace(context, 'Office $text'),
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

  showNearbyPlace(BuildContext context, String title) => showModalBottomSheet(
      elevation: 6,
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) => Container(
        height: 361,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: context.resources.color.textBoldColor),
                  ),
                  IconButton(
                      onPressed: () => AppRoute.back(),
                      icon: const Icon(Icons.close))
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "What's Nearby ?",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: context.resources.color.textColor),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ItemNearbyPlace(text: index.toString());
                  }, separatorBuilder: (BuildContext context, int index) => const SpaceWidget(space: 16,),),
            )
          ],
        ),
      ));
}
