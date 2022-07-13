import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/res/custom_icons.dart';
import 'package:kanbo/screen/booking/booking_screen.dart';
import 'package:kanbo/screen/chat/direct_message_screen.dart';
import 'package:kanbo/screen/room/components/header_room_section.dart';
import 'package:kanbo/screen/room/components/image_room_section.dart';
import 'package:kanbo/screen/room/components/review_room_section.dart';
import 'package:kanbo/screen/room/components/spec_room_section.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/utils/app_route.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:sizer/sizer.dart';

import '../../utils/currency_format.dart';

class DetailRoomScreen extends StatelessWidget {
  final String text;
  const DetailRoomScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = context.mediaSize;
    List<Widget> listWidget = [
      const ImageRoomSection(),
      HeaderRoomSection(
        text: text,
      ),
      const SpecRoomSection(),
      ReviewRoomSection(
        text: text,
      )
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Room $text',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: listWidget.length,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (context, index) => listWidget[index],
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                  height: 4,
                  color: context.resources.color.white2,
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Price',
                          style: TextStyle(
                              color: context.resources.color.textBoldColor,
                              fontSize: 12.sp)),
                      const SpaceWidget(
                        space: 5,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: CurrencyFormat.convertToIdr(300000),
                            style: TextStyle(
                                color: context.resources.color.colorPrimary,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: ' /day', style: TextStyle(fontSize: 10.sp))
                      ]))
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => AppRoute.to(DirectMessageScreen(
                          title: text,
                        )),
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: context.resources.color.colorPrimary),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: Icon(
                            CustomIcons.envelope_outline,
                            color: context.resources.color.colorPrimary,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 100,
                          height: 42,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ))),
                              onPressed: () => AppRoute.to(BookingScreen(
                                    text: 'Room $text',
                                  )),
                              child: const Text('Book')))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
