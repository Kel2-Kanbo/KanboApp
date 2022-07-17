import 'package:flutter/material.dart';
import 'package:kanbo/model/payment.dart';

class TutorialPaymentSection extends StatelessWidget {
  final Payment payment;
  const TutorialPaymentSection({Key? key, required this.payment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          ExpansionTile(
            title: const Text(
              'Payment instruction ATM',
            ),
            childrenPadding: const EdgeInsets.symmetric(vertical: 8),
            expandedAlignment: Alignment.topLeft,
            children: [Text(payment.tutorialAtm ?? '-')],
          ),
          const Divider(),
          ExpansionTile(
            title: const Text(
              'Payment instruction mBanking',
            ),
            childrenPadding: const EdgeInsets.symmetric(vertical: 8),
            expandedAlignment: Alignment.topLeft,
            children: [Text(payment.tutorialMBanking ?? '-')],
          ),
          const Divider(),
          ExpansionTile(
            title: const Text(
              'Payment instruction iBanking',
            ),
            childrenPadding: const EdgeInsets.symmetric(vertical: 8),
            expandedAlignment: Alignment.topLeft,
            children: [Text(payment.tutorialiBanking ?? '-')],
          ),
        ],
      ),
    );
  }
}
