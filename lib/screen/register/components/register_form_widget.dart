import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kanbo/res/app_context_ext.dart';
import 'package:sizer/sizer.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({Key? key}) : super(key: key);

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  String password = '';
  bool _isHiddenPassword = true;
  bool _isHiddenConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text('Create your account!',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderTextField(
          name: 'name',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: 'Name',
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
          name: 'email',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: 'Email',
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
          obscureText: _isHiddenPassword,
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
                      _isHiddenPassword = !_isHiddenPassword;
                    }),
                icon: Icon(_isHiddenPassword
                    ? Icons.visibility
                    : Icons.visibility_off)),
          ),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                password = value;
              });
            }
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: context.resources.string.tidakBolehKosong),
            FormBuilderValidators.minLength(8)
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderTextField(
          name: 'confrim_password',
          obscureText: _isHiddenConfirmPassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: 'Confirm Password',
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none),
            suffixIcon: IconButton(
                onPressed: () => setState(() {
                      _isHiddenConfirmPassword = !_isHiddenConfirmPassword;
                    }),
                icon: Icon(_isHiddenConfirmPassword
                    ? Icons.visibility
                    : Icons.visibility_off)),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: context.resources.string.tidakBolehKosong),
            FormBuilderValidators.equal(password,
                errorText: context.resources.string.passwordTidakSama)
          ]),
        ),
      ],
    );
  }
}
