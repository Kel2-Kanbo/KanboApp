import 'package:flutter/material.dart';
import 'package:kanbo/model/office.dart';
import 'package:kanbo/screen/office/detail_office_screen.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class ItemOfficeAdapter extends StatelessWidget {
  final Office office;
  const ItemOfficeAdapter({
    Key? key,
    required this.office,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 170,
        child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            onTap: () => AppRoute.to(DetailOfficeScreen(
              office: office,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    width: size.width,
                    height: 110,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        office.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            office.title,
                            style: TextStyle(
                                color: context.resources.color.textBoldColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingWidget(
                              rating: office.rating,
                              review: office.review,
                            ),
                            const SpaceWidget(
                              space: 10,
                            ),
                            SimpleLocationWidget(
                              address: office.address,
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
