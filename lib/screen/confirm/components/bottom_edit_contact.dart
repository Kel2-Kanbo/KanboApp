import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kanbo/model/order.dart';
import 'package:kanbo/export_package.dart';

import '../../booking/components/contact_form.dart';

class BottomEditContact extends StatefulWidget {
  final Order order;
  final Function(Order) onChangeContact;
  const BottomEditContact(
      {Key? key,
      required this.order,
      required this.onChangeContact})
      : super(key: key);
  @override
  State<BottomEditContact> createState() => _BottomEditContactState();
}

class _BottomEditContactState extends State<BottomEditContact> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late Order order;
  @override
  void initState() {
    order = widget.order;
    _nameController.text = order.name;
    _emailController.text = order.email;
    _phoneController.text = order.phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return Column(
      children: [
        ContactForm(
          name: order.name,
          email: order.email,
          phoneNumber: order.phoneNumber,
          formKey: _formKey,
          emailController: _emailController,
          nameController: _nameController,
          phoneController: _phoneController,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
              width: size.width,
              height: 36,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var name = _nameController.value.text;
                      var email = _emailController.value.text;
                      var phone = _phoneController.value.text;
                      order.name = name;
                      order.email = email;
                      order.phoneNumber = phone;
                      setState(() {
                        widget.onChangeContact(order);
                      });
                      AppRoute.back();
                    }
                  },
                  child: const Text('Save'))),
        )
      ],
    );
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
