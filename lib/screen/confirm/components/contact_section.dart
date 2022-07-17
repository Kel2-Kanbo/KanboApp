import 'package:flutter/material.dart';
import 'package:kanbo/model/order.dart';
import 'package:kanbo/screen/confirm/components/bottom_edit_contact.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class ContactSection extends StatefulWidget {
  final Order order;
  final Function(Order) onChangeContact;
  const ContactSection({
    Key? key,
    required this.order,
    required this.onChangeContact,
  }) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  late Order _order;
  @override
  void initState() {
    _order = widget.order;
    super.initState();
  }

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
                      Expanded(
                        child: Text(_order.name),
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
                  Text(_order.email),
                  const SpaceWidget(
                    space: 5,
                  ),
                  Text(_order.phoneNumber),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _showEditContact(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        ),
        builder: (context) => BottomEditContact(
              order: _order,
              onChangeContact: (Order order) => setState(() {
                _order = order;
                widget.onChangeContact(order);
              }),
            ));
  }
}
