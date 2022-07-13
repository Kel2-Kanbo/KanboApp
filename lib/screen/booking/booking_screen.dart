import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kanbo/screen/confirm/confirm_screen.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/utils/app_route.dart';

import 'components/contact_form.dart';
import 'components/date_form.dart';
import 'components/room_details_section.dart';

class BookingScreen extends StatefulWidget {
  final String text;
  const BookingScreen({Key? key, required this.text}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Booking Form',
          style: TextStyle(color: Colors.black),
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
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => getListWidgetBooking()[index],
                separatorBuilder: (context, index) => Container(
                      height: 4,
                      color: context.resources.color.white2,
                    ),
                itemCount: getListWidgetBooking().length),
          ),
          Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
              ],
            ),
            child: SizedBox(
              height: 55,
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ))),
                  onPressed: () {
                    AppRoute.to(const ConfirmScreen());
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      var name = _formKey.currentState?.value['name'];
                      log(name);
                    }
                  },
                  child: const Text('Confirm')),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getListWidgetBooking() => [
        RoomDetailsSection(
          text: widget.text,
        ),
        const DateForm(),
        ContactForm(
          formKey: _formKey,
        )
      ];

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
