import 'package:flutter/material.dart';
import 'package:kanbo/model/order.dart';
import 'package:kanbo/screen/review/review_screen.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class ItemBooking extends StatelessWidget {
  final Order order;
  const ItemBooking({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = [
      Text(
        order.room.title,
        style: TextStyle(
            fontSize: 14.sp,
            color: context.resources.color.textBoldColor,
            fontWeight: FontWeight.bold),
      ),
      Text(
        context.resources.list.listOffice[order.room.officeId].title,
        style: TextStyle(
          fontSize: 12.sp,
          color: context.resources.color.textBoldColor,
        ),
      ),
      SimpleLocationWidget(
        address: context.resources.list.listOffice[order.room.officeId].address,
      ),
      Text(
        '${order.duration} Days',
        style: TextStyle(
          fontSize: 12.sp,
          color: context.resources.color.colorPrimary,
        ),
      )
    ];
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Booked date : ${order.getDateRange()}',
              style: TextStyle(
                  fontSize: 10.sp,
                  color: context.resources.color.textBoldColor),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Flexible(
                    child: Container(
                        width: 75,
                        height: 75,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.network(
                          order.room.thumbnails[0],
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Payment :',
                          style: TextStyle(
                              color: context.resources.color.textColor,
                              fontSize: 10.sp),
                        ),
                        Text(
                          order.totalPrice.toString(),
                          style: TextStyle(
                              color: context.resources.color.textBoldColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ))),
                        onPressed: () => AppRoute.to(ReviewScreen(
                              room: order.room,
                            )),
                        child: const Text('Give Review')))
              ],
            ),
          )
        ],
      ),
    );
  }
}
