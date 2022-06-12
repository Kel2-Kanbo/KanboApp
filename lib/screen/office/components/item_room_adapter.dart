import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/screen/room/detail_room_screen.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_route.dart';
import '../../../utils/currency_format.dart';
import '../../../widgets/rating_widget.dart';

class ItemRoomAdapter extends StatelessWidget {
  final String text;
  const ItemRoomAdapter({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> servicesList = ["Wifi", "AC", "Proyektor", "DLL"]; 
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          elevation: 6,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: () => AppRoute.to(DetailRoomScreen(text: text)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  height: 125,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1479839672679-a46483c0e7c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(
                          'Room $text',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: context.resources.color.textBoldColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const RatingWidget(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: CurrencyFormat.convertToIdr(300000),
                        style:
                            TextStyle(color: context.resources.color.colorPrimary, fontSize: 12.sp)),
                    TextSpan(text: ' /day', style:
                            TextStyle(fontSize: 10.sp))
                  ])),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(servicesList.join(' • '), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10.sp),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
