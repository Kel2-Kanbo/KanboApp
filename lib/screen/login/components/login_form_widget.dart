import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text('Login to continue!',
              style: TextStyle(fontSize: 14.sp, color: context.resources.color.textBoldColor, fontWeight: FontWeight.bold)),
        ),
        const SpaceWidget(),
        FormBuilderTextField(
          name: 'email',
          style: const TextStyle(color: Colors.black,),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Email',
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: context.resources.color.grey3)),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.email(),
            FormBuilderValidators.required(
                errorText: context.resources.string.tidakBolehKosong),
          ]),
        ),
        SpaceWidget(space: 3.h,),
        FormBuilderTextField(
          name: 'password',
          obscureText: _isHidden,
          style: const TextStyle(color: Colors.black,),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: context.resources.string.password,
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: context.resources.color.grey3)),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: IconButton(
                onPressed: () => setState(() {
                      _isHidden = !_isHidden;
                    }),
                icon:
                    Icon(_isHidden ? Icons.visibility : Icons.visibility_off)),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: context.resources.string.tidakBolehKosong),
          ]),
        ),
        const SpaceWidget(space: 16,),
      ],
    );
  }
}
