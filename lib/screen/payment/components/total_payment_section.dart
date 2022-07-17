import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/model/payment.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';
import 'package:kanbo/utils/currency_format.dart';

class TotalPaymentSection extends StatelessWidget {
  final int totalPrice;
  final Payment payment;
  const TotalPaymentSection(
      {Key? key, required this.totalPrice, required this.payment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Payment',
            style: TextStyle(
              fontSize: 16.sp,
              color: context.resources.color.textBoldColor,
            ),
          ),
          const SpaceWidget(
            space: 8,
          ),
          Container(
            width: size.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                color: context.resources.color.white2,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                Expanded(child: Text(CurrencyFormat.convertToIdr(totalPrice))),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: '$totalPrice'));
                    context.snackbar.showSnackBar(
                        const SnackBar(content: Text('Price copied')));
                  },
                  child: const Icon(
                    Icons.copy,
                    size: 16,
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          Text(
            'Transfer To',
            style: TextStyle(
              fontSize: 16.sp,
              color: context.resources.color.textBoldColor,
            ),
          ),
          const SpaceWidget(
            space: 8,
          ),
          Container(
            width: size.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                color: context.resources.color.white2,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                Expanded(
                    child: Text('${payment.title} VA No. ${payment.numberVa}')),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: payment.numberVa));
                    context.snackbar.showSnackBar(
                        const SnackBar(content: Text('No.VA copied')));
                  },
                  child: const Icon(
                    Icons.copy,
                    size: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
