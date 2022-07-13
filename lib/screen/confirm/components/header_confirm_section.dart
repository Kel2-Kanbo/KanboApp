import 'package:flutter/material.dart';
import 'package:kanbo/screen/booking/components/room_details_section.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:sizer/sizer.dart';

class HeaderConfirmSection extends StatelessWidget {
  final String text;
  const HeaderConfirmSection({Key? key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RoomDetailsSection(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: context.resources.color.textBoldColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: const [
                    Expanded(child: Text('BUAT TANGGAL')),
                    Text('- Days')
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
