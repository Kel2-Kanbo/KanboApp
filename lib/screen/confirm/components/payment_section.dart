import 'package:flutter/material.dart';
import 'package:kanbo/model/payment.dart';
import 'package:kanbo/screen/confirm/components/item_payment.dart';
import 'package:kanbo/export_package.dart';

class PaymentSection extends StatefulWidget {
  final Function(Payment) onPaymentChange;
  const PaymentSection({Key? key, required this.onPaymentChange})
      : super(key: key);

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  int selectedId = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment method',
            style: TextStyle(
              fontSize: 16.sp,
              color: context.resources.color.textBoldColor,
            ),
          ),
          SizedBox(
              width: size.width,
              height: 60,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 8),
                scrollDirection: Axis.horizontal,
                itemCount: context.resources.list.listPayment.length,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  final Payment payment =
                      context.resources.list.listPayment[index];
                  return ItemPayment(
                    index: index,
                    selectedId: selectedId,
                    onSelected: (id) => setState(() {
                      selectedId = id;
                      widget.onPaymentChange(
                          context.resources.list.listPayment[id]);
                    }),
                    payment: payment,
                  );
                },
              ))
        ],
      ),
    );
  }
}
