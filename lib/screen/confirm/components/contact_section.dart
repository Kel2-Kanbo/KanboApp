import 'package:flutter/material.dart';
import 'package:kanbo/screen/booking/components/contact_form.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:sizer/sizer.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact details',
            style: TextStyle(
              fontSize: 16.sp,
              color: context.resources.color.textBoldColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 22),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  color: context.resources.color.white2,
                  borderRadius: const BorderRadius.all(Radius.circular(4))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text('NAMA USER'),
                      ),
                      GestureDetector(
                        onTap: () => _showEditContact(context),
                        child: Icon(Icons.edit,
                            size: 16, color: context.resources.color.grey2),
                      )
                    ],
                  ),
                  const SpaceWidget(
                    space: 5,
                  ),
                  const Text('EMAIL USER'),
                  const SpaceWidget(
                    space: 5,
                  ),
                  const Text('PHONE USER'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _showEditContact(BuildContext context) {
    final Size size = context.mediaSize;
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        builder: (context) => Column(
              children: [
                const ContactForm(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                      width: size.width,
                      height: 36,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Save'))),
                )
              ],
            ));
  }
}
