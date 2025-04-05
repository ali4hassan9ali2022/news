import 'package:flutter/material.dart';
import 'package:news/Core/Helper/helper.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.onTap,
    required this.type, this.onChanged,
  });
  final String hintText;
  final Function(String)? onChanged;
  final IconData prefixIcon;
  final TextEditingController controller;
  final Function() onTap;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
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
