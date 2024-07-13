import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:login_screen/core/themes/app_colors.dart';

class PhoneTextFormFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final String selectedCountryCode;
  final String? Function(String?) validator;
  final Function(String) onCountryCodeChanged;

  const PhoneTextFormFieldWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    required this.selectedCountryCode,
    required this.validator,
    required this.onCountryCodeChanged,
  });

  @override
  State<PhoneTextFormFieldWidget> createState() =>
      _PhoneTextFormFieldWidgetState();
}

class _PhoneTextFormFieldWidgetState extends State<PhoneTextFormFieldWidget> {
  List<String> countryCodes = ['+91', '+23', '+55'];

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
          keyboardType: TextInputType.number,
          inputFormatters: [
            MaskedInputFormatter('(##) #####-####'),
          ],
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
            filled: true,
            fillColor: Colors.transparent,
            prefixIcon: DropdownMenu<String>(
              inputDecorationTheme: const InputDecorationTheme(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.transparent,
                filled: true,
              ),
              width: 100,
              initialSelection: countryCodes.first,
              onSelected: (String? value) {
                widget.onCountryCodeChanged(value!);
              },
              dropdownMenuEntries:
                  countryCodes.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            isDense: true,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
