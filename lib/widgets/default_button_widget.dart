import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String btnTitle;
  final VoidCallback onPressed;
  const DefaultButtonWidget(this.btnTitle, {Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 7.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: onPressed,
          child: Text(btnTitle)),
    );
  }
}
