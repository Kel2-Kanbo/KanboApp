import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';

class ItemPayment extends StatelessWidget {
  final int index;
  final int selectedId;
  final Function(int)? onSelected;
  const ItemPayment(
      {Key? key,
      required this.index,
      required this.selectedId,
      this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: () {
          if (onSelected != null) {
            onSelected!(index);
          }
        },
        child: Container(
          width: 95,
          height: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: selectedId == index
                  ? context.resources.color.colorPrimary[200]
                  : Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: context.resources.color.grey3)),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}
