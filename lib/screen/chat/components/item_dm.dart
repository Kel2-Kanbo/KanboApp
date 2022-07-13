import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';

class ItemDm extends StatelessWidget {
  final String text;
  final bool isUser;
  const ItemDm({Key? key, this.text = '-', this.isUser = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              color: context.resources.color.colorPrimary[50],
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: isUser ? const Radius.circular(16) : Radius.zero,
                  bottomRight:
                      isUser ? Radius.zero : const Radius.circular(16))),
          child: Text(
            isUser
                ? '$text jklsdjgljsd dklghsdkhgklsdhj dsghsdklg hklsdhgs sdgklhsdklghkls dlghsdklhgflsdhg sdghsdklghsdkl gsdklghsdklgh'
                : text,
          ),
        )
      ],
    );
  }
}
