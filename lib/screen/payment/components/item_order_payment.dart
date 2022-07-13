import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/space_widget.dart';

class ItemOrderPayment extends StatelessWidget {
  final String text;
  const ItemOrderPayment({Key? key, this.text = '-'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: context.resources.color.white2,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Flexible(
                      child: Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1551128997-c2b66772f982',
                            fit: BoxFit.fill,
                          ))),
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Room $text',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: context.resources.color.textBoldColor,
                            )),
                        const SpaceWidget(
                          space: 4,
                        ),
                        Text(
                          'Building $text',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: context.resources.color.textBoldColor,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.calendar_month,
                  color: context.resources.color.grey2,
                ),
              ),
              const Text('Buat range tanggal  •  0 days')
            ],
          )
        ],
      ),
    );
  }
}
