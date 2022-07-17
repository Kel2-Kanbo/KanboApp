import 'package:flutter/material.dart';
import 'package:kanbo/model/order.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class ItemOrderPayment extends StatelessWidget {
  final Order order;
  const ItemOrderPayment({Key? key, required this.order}) : super(key: key);

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
                  child: Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8)),
                      child: Image.network(
                        order.room.thumbnails[0],
                        fit: BoxFit.fill,
                      )),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.room.title,
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
                      context
                          .resources.list.listOffice[order.room.officeId].title,
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
              Expanded(child: Text('${order.getDateRange()}  •  ${order.duration} days'))
            ],
          )
        ],
      ),
    );
  }
}
