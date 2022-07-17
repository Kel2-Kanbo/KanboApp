import 'package:flutter/material.dart';
import 'package:kanbo/model/order.dart';
import 'package:kanbo/screen/payment/components/header_payment_section.dart';
import 'package:kanbo/screen/payment/components/total_payment_section.dart';
import 'package:kanbo/screen/payment/components/tutorial_payment_section.dart';
import 'package:kanbo/export_package.dart';

import '../main/main_screen.dart';

class PaymentScreen extends StatelessWidget {
  final Order order;
  const PaymentScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => getListWidgetPayment()[index],
                separatorBuilder: (context, index) => Container(
                      height: 4,
                      color: context.resources.color.white2,
                    ),
                itemCount: getListWidgetPayment().length),
          ),
          Container(
              width: size.width,
              height: 53,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                  onPressed: () => AppRoute.clearAll(const MainScreen()),
                  child: const Text('Back')))
        ],
      ),
    );
  }

  List<Widget> getListWidgetPayment() => [
        HeaderPaymentSection(
          order: order,
        ),
        TotalPaymentSection(
          payment: order.payment,
          totalPrice: order.totalPrice,
        ),
        TutorialPaymentSection(
          payment: order.payment,
        )
      ];
}
