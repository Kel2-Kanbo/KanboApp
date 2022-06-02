import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kanbo/res/app_context_ext.dart';
import 'package:sizer/sizer.dart';

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
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderTextField(
          name: 'username',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: context.resources.string.username,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: context.resources.string.tidakBolehKosong),
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderTextField(
          name: 'password',
          obscureText: _isHidden,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: context.resources.string.password,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none),
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
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
