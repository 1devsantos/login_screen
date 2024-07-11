import 'package:flutter/material.dart';
import 'package:login_screen/core/themes/app_colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final bool securityField;
  final String? Function(String?) validator;

  const TextFormFieldWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.securityField = false,
    required this.validator,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.secondary,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 1,
                ),
            ),
            isDense: true,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
          ),
          validator: widget.validator,
        )
      ],
    );
  }
}
