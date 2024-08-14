import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.onChanged,
    this.validator,
    this.hintText = 'Select an option',
    this.initialValue,
    required this.items,
  });
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final String hintText;
  final T? initialValue;
  final List<T> items;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(24),
        labelText: hintText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      value: initialValue,
      items: items.map(
        (T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(
              value.toString(),
            ),
          );
        },
      ).toList(),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
