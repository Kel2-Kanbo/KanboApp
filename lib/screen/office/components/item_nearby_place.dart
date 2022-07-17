import 'package:flutter/material.dart';
import 'package:kanbo/model/nearby_places.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class ItemNearbyPlace extends StatelessWidget {
  final NearbyPlaces nearbyPlaces;
  const ItemNearbyPlace({Key? key, required this.nearbyPlaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nearbyPlaces.title,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: context.resources.color.textBoldColor),
              ),
              const SpaceWidget(
                space: 2,
              ),
              Text(
                '${nearbyPlaces.distance} Km (${nearbyPlaces.estimate} min)',
                style: TextStyle(
                    fontSize: 10.sp, color: context.resources.color.grey2),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            nearbyPlaces.category,
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 12.sp, color: context.resources.color.textBoldColor),
          ),
        )
      ],
    );
  }
}
