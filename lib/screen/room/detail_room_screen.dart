import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/screen/room/components/header_room_section.dart';
import 'package:kanbo/screen/room/components/image_room_section.dart';
import 'package:kanbo/screen/room/components/review_room_section.dart';
import 'package:kanbo/screen/room/components/spec_room_section.dart';
import 'package:kanbo/utils/app_context_ext.dart';
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
      HeaderRoomSection(text: text,),
      const SpecRoomSection(),
      ReviewRoomSection(text: text,)
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8),
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
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, -6))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
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
                  child: SizedBox(
                      width: 130,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ))),
                          onPressed: () =>
                              context.snackbar.showSnackBar(const SnackBar(
                                content: Text('Coming Soon'),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                    bottom: 65, left: 16, right: 16),
                              )),
                          child: const Text('Book'))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
