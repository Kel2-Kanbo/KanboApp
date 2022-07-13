import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kanbo/screen/booking/components/booking_textfield_widget.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/space_widget.dart';
import 'package:sizer/sizer.dart';

class ContactForm extends StatelessWidget {
  final Key? formKey;
  const ContactForm({Key? key, this.formKey}) : super(key: key);

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
            const BookingTextFieldWidget(
              name: 'name',
              labelText: 'Name',
              textInputType: TextInputType.name,
            ),
            const SpaceWidget(
              space: 16,
            ),
            BookingTextFieldWidget(
              name: 'email',
              labelText: 'Email',
              textInputType: TextInputType.emailAddress,
              validators: [FormBuilderValidators.email()],
            ),
            const SpaceWidget(
              space: 16,
            ),
            BookingTextFieldWidget(
              name: 'phone',
              labelText: 'Phone Number',
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
