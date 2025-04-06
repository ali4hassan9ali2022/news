import 'package:flutter/material.dart';
import 'package:news/Core/Helper/helper.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.onTap,
    required this.type,required this.onChanged,required this.validator,
  });
  final String hintText;
  final Function(String) onChanged;
  final IconData prefixIcon;
  final TextEditingController controller;
  final Function() onTap;
  final TextInputType type;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }
}
