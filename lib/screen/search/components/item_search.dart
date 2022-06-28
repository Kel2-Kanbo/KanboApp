import 'package:flutter/material.dart';
import 'package:kanbo/screen/office/detail_office_screen.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/utils/app_route.dart';
import 'package:kanbo/widgets/rating_widget.dart';
import 'package:kanbo/widgets/simple_location_widget.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:sizer/sizer.dart';

class ItemSearch extends StatelessWidget {
  final String text;
  const ItemSearch({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = [
      Text(
        'Office $text',
        style: TextStyle(
            fontSize: 14.sp,
            color: context.resources.color.textBoldColor,
            fontWeight: FontWeight.bold),
      ),
      RatingWidget(),
      SimpleLocationWidget(text: text)
    ];
    return InkWell(
      onTap: () => AppRoute.to(DetailOfficeScreen(text: text)),
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
                      'https://images.unsplash.com/photo-1551128997-c2b66772f982',
                      fit: BoxFit.fill,
                    ))),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => content[index],
                  separatorBuilder: (context, index) => const SpaceWidget(
                        space: 4,
                      ),
                  itemCount: content.length),
            ))
          ],
        ),
      ),
    );
  }
}
