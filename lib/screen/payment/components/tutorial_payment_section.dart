import 'package:flutter/material.dart';

class TutorialPaymentSection extends StatelessWidget {
  const TutorialPaymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: const [
          ExpansionTile(
            title: Text(
              'Payment instruction ATM',
            ),
            childrenPadding: EdgeInsets.symmetric(vertical: 8),
            expandedAlignment: Alignment.topLeft,
            children: [Text('Lorem ipsum.')],
          ),
          Divider(),
          ExpansionTile(
            title: Text(
              'Payment instruction mBanking',
            ),
            childrenPadding: EdgeInsets.symmetric(vertical: 8),
            expandedAlignment: Alignment.topLeft,
            children: [Text('Lorem ipsum.')],
          ),
          Divider(),
          ExpansionTile(
            title: Text(
              'Payment instruction iBanking',
            ),
            childrenPadding: EdgeInsets.symmetric(vertical: 8),
            expandedAlignment: Alignment.topLeft,
            children: [Text('Lorem ipsum.')],
          ),
        ],
      ),
    );
  }
}
