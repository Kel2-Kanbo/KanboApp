import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/space_widget.dart';
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
              style: TextStyle(
                  fontSize: 14.sp,
                  color: context.resources.color.textBoldColor,
                  fontWeight: FontWeight.bold)),
        ),
        const SpaceWidget(),
        FormBuilderTextField(
          name: 'name',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: context.resources.color.grey3)),
            hintText: 'Name',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: context.resources.string.tidakBolehKosong),
          ]),
        ),
        SpaceWidget(
          space: 2.h,
        ),
        FormBuilderTextField(
          name: 'username',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: context.resources.color.grey3)),
            hintText: context.resources.string.username,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
                errorText: context.resources.string.tidakBolehKosong),
            FormBuilderValidators.minLength(3),
            FormBuilderValidators.maxLength(20)
          ]),
        ),
        SpaceWidget(
          space: 2.h,
        ),
        FormBuilderTextField(
          name: 'email',
          style: const TextStyle(
            color: Colors.black,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: context.resources.color.grey3)),
            hintText: 'Email',
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
        SpaceWidget(
          space: 2.h,
        ),
        FormBuilderTextField(
          name: 'password',
          style: const TextStyle(
            color: Colors.black,
          ),
          obscureText: _isHiddenPassword,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: context.resources.color.grey3)),
            hintText: context.resources.string.password,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
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
            FormBuilderValidators.minLength(8),
            FormBuilderValidators.maxLength(40)
          ]),
        ),
        SpaceWidget(
          space: 2.h,
        ),
        FormBuilderTextField(
          name: 'confrim_password',
          style: const TextStyle(
            color: Colors.black,
          ),
          obscureText: _isHiddenConfirmPassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: context.resources.color.grey3)),
            hintText: 'Confirm Password',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
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
            FormBuilderValidators.maxLength(40),
            FormBuilderValidators.equal(password,
                errorText: context.resources.string.passwordTidakSama)
          ]),
        ),
        SpaceWidget(
          space: 3.h,
        ),
      ],
    );
  }
}
