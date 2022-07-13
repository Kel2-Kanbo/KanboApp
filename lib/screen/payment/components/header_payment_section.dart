import 'package:flutter/material.dart';
import 'package:kanbo/screen/payment/components/item_order_payment.dart';
import 'package:kanbo/utils/app_context_ext.dart';

class HeaderPaymentSection extends StatelessWidget {
  const HeaderPaymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(child: Text('Complete payment before')),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: context.resources.color.colorPrimary[50],
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(80, 70))),
                child: Text(
                  '00 : 00 : 00',
                  style: TextStyle(color: context.resources.color.colorPrimary),
                ),
              ),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Order ID '),
                Text('1234567890')
              ],
            ),
          ),
          const ItemOrderPayment()
        ],
      ),
    );
  }
}
