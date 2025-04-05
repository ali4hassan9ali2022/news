import 'package:flutter/material.dart';
import 'package:news/Core/Widgets/custom_text_form_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        CustomTextField(hintText: "search", prefixIcon: Icons.search, controller: , validator: validator, onTap: onTap, type: type)
      ],),
    );
  }
}
