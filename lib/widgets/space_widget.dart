import 'package:flutter/material.dart';

class SpaceWidget extends StatelessWidget {
  final double? space;
  final bool isVerticalSpace;
  const SpaceWidget({Key? key, this.space = 15, this.isVerticalSpace = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isVerticalSpace ? space : 0,
      width: !isVerticalSpace ? space : 0,
    );
  }
}
