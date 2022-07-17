import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kanbo/export_package.dart';
import 'package:kanbo/model/payment.dart';
import 'package:kanbo/model/room.dart';
import 'package:kanbo/screen/confirm/confirm_screen.dart';

import '../../model/order.dart';
import '../../model/review_response.dart';
import '../../model/specification.dart';
import 'components/contact_form.dart';
import 'components/date_form.dart';
import 'components/room_details_section.dart';

class BookingScreen extends StatefulWidget {
  final Room room;
  const BookingScreen({Key? key, required this.room}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final Order order = Order(
      room: Room(specification: Specification(), review: ReviewResponse()),
      payment: Payment());

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
                    order.room = widget.room;
                    if (_formKey.currentState!.validate() &&
                        order.duration > 0) {
                      _formKey.currentState!.save();
                      var name = _formKey.currentState?.value['name'] as String;
                      var email =
                          _formKey.currentState?.value['email'] as String;
                      var phone =
                          _formKey.currentState?.value['phone'] as String;
                      order.name = name;
                      order.email = email;
                      order.phoneNumber = phone;
                      order.totalPrice =
                          order.room.pricePerDay * order.duration;
                      AppRoute.to(ConfirmScreen(
                        order: order,
                      ));
                    } else {
                      context.snackbar.showSnackBar(const SnackBar(
                        content: Text('Mohon periksa kembali'),
                        backgroundColor: Colors.redAccent,
                      ));
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
          room: widget.room,
        ),
        DateForm(
          onChangeDate: (DateTimeRange dateTimeRange) {
            order.duration = dateTimeRange.duration.inDays + 1;
            order.startDate = dateTimeRange.start;
            order.endDate = dateTimeRange.end;
          },
        ),
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
