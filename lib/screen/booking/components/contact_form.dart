import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';
import 'package:kanbo/screen/booking/components/booking_textfield_widget.dart';

class ContactForm extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final Key formKey;
  final TextEditingController? nameController;
  final TextEditingController? emailController;
  final TextEditingController? phoneController;
  const ContactForm({
    Key? key,
    required this.formKey,
    this.name = '',
    this.email = '',
    this.phoneNumber = '',
    this.nameController,
    this.emailController,
    this.phoneController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: FormBuilder(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Details',
              style: TextStyle(
                fontSize: 16.sp,
                color: context.resources.color.textBoldColor,
              ),
            ),
            const SpaceWidget(
              space: 16,
            ),
            BookingTextFieldWidget(
              name: 'name',
              labelText: 'Name',
              textInputType: TextInputType.name,
              controller: nameController,
            ),
            const SpaceWidget(
              space: 16,
            ),
            BookingTextFieldWidget(
              name: 'email',
              labelText: 'Email',
              controller: emailController,
              textInputType: TextInputType.emailAddress,
              validators: [FormBuilderValidators.email()],
            ),
            const SpaceWidget(
              space: 16,
            ),
            BookingTextFieldWidget(
              name: 'phone',
              labelText: 'Phone Number',
              controller: phoneController,
              textInputType: TextInputType.phone,
              validators: [
                FormBuilderValidators.numeric(),
                FormBuilderValidators.maxLength(15)
              ],
            ),
            const SpaceWidget(
              space: 16,
            ),
          ],
        ),
      ),
    );
  }
}
