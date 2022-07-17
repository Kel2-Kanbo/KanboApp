import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kanbo/screen/confirm/components/contact_section.dart';
import 'package:kanbo/screen/confirm/components/header_confirm_section.dart';
import 'package:kanbo/screen/confirm/components/payment_section.dart';
import 'package:kanbo/utils/currency_format.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

import '../../model/order.dart';
import '../../model/payment.dart';
import '../../model/review_response.dart';
import '../../model/room.dart';
import '../../model/specification.dart';
import '../payment/payment_screen.dart';

class ConfirmScreen extends StatefulWidget {
  final Order order;
  const ConfirmScreen({Key? key, required this.order}) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  Payment _payment = Payment();
  Order _order = Order(
      room: Room(specification: Specification(), review: ReviewResponse()),
      payment: Payment());

  @override
  void initState() {
    _payment = context.resources.list.listPayment[0];
    _order = widget.order;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Confirmation',
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
                itemBuilder: (context, index) => getListWidgetConfirm()[index],
                separatorBuilder: (context, index) => Container(
                      height: 4,
                      color: context.resources.color.white2,
                    ),
                itemCount: getListWidgetConfirm().length),
          ),
          Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Total'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(_payment.title),
                          const SpaceWidget(
                            space: 2,
                          ),
                          Text(CurrencyFormat.convertToIdr(
                              widget.order.totalPrice))
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: size.width,
                    height: 53,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ))),
                        onPressed: () {
                          _order.payment = _payment;
                          AppRoute.to(PaymentScreen(
                            order: _order,
                          ));
                        },
                        child: const Text('Pay')),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getListWidgetConfirm() => [
        HeaderConfirmSection(
          room: widget.order.room,
          date: widget.order.getDateRange(),
          duration: widget.order.duration,
        ),
        ContactSection(
          order: _order,
          onChangeContact: (order) {
            _order.name = order.name;
            _order.email = order.email;
            _order.phoneNumber = order.phoneNumber;
          },
        ),
        PaymentSection(
          onPaymentChange: (payment) => setState(() => _payment = payment),
        )
      ];

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
