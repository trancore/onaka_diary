import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart'
    show FormBuilderValidators;

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color.fromARGB(255, 252, 201, 188),
    width: 1,
  ),
);
const OutlineInputBorder outlineErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Color.fromARGB(127, 255, 0, 0),
    width: 1,
  ),
);

class TextForm extends StatefulWidget {
  const TextForm({
    super.key,
    required this.formTextKey,
    required this.label,
    this.validator,
  });

  final GlobalKey<FormBuilderFieldState> formTextKey;
  final String label;
  final List<FormFieldValidator<String>>? validator;

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Color.fromARGB(127, 102, 68, 48),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        FormBuilderTextField(
          key: widget.formTextKey,
          name: "text",
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            focusedBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            errorBorder: outlineErrorBorder,
            focusedErrorBorder: outlineErrorBorder,
            errorText: widget.formTextKey.currentState?.errorText ?? "",
            errorStyle: const TextStyle(
              color: Color.fromARGB(127, 255, 0, 0),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          validator: FormBuilderValidators.compose(widget.validator ?? []),
        ),
      ],
    );
  }
}
