import 'package:flutter/material.dart';
import 'package:kanbo/model/office.dart';
import 'package:kanbo/screen/office/detail_office_screen.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class ItemSearch extends StatelessWidget {
  final Office office;
  const ItemSearch({Key? key, required this.office}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRoute.to(DetailOfficeScreen(
        office: office,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Flexible(
                child: Container(
                    width: 128,
                    height: 128,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Image.network(
                      office.image,
                      fit: BoxFit.fill,
                    ))),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => _getContent(context)[index],
                  separatorBuilder: (context, index) => const SpaceWidget(
                        space: 4,
                      ),
                  itemCount: _getContent(context).length),
            ))
          ],
        ),
      ),
    );
  }

  List<Widget> _getContent(BuildContext context) => [
        Text(
          office.title,
          style: TextStyle(
              fontSize: 14.sp,
              color: context.resources.color.textBoldColor,
              fontWeight: FontWeight.bold),
        ),
        RatingWidget(
          rating: office.rating,
          review: office.review,
        ),
        SimpleLocationWidget(
          address: office.address,
        )
      ];
}
