import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:sizer/sizer.dart';

class TotalPaymentSection extends StatelessWidget {
  const TotalPaymentSection({Key? key}) : super(key: key);

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
          const SpaceWidget(space: 8,),
          Container(
            width: size.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                color: context.resources.color.white2,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                const Expanded(child: Text('Buat Harga')),
                GestureDetector(onTap: () {}, child: const Icon(Icons.copy, size: 16,),)
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
          const SpaceWidget(space: 8,),
          Container(
            width: size.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                color: context.resources.color.white2,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                const Expanded(child: Text('Buat NOREK')),
                GestureDetector(onTap: () {}, child: const Icon(Icons.copy, size: 16,),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
