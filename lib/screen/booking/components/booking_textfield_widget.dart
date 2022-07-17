import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kanbo/export_package.dart';

class BookingTextFieldWidget extends StatelessWidget {
  final String name;
  final String labelText;
  final TextInputType? textInputType;
  final List<String? Function(String?)>? validators;
  final TextEditingController? controller;
  const BookingTextFieldWidget(
      {Key? key,
      required this.name,
      this.textInputType,
      this.validators,
      required this.labelText,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        name: name,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        textCapitalization: labelText.toLowerCase() == 'name'
            ? TextCapitalization.words
            : TextCapitalization.none,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: context.resources.color.grey3)),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator:
            FormBuilderValidators.compose(getValidators(context, validators)));
  }

  List<FormFieldValidator<String>> getValidators(
      BuildContext context, List<String? Function(String?)>? validators) {
    List<FormFieldValidator<String>> listValidators = [];
    listValidators.add(
      FormBuilderValidators.required(
          errorText: context.resources.string.tidakBolehKosong),
    );
    if (validators != null && validators.isNotEmpty) {
      listValidators.addAll(validators);
    }

    return listValidators;
  }
}
