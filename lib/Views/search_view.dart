import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Widgets/custom_text_form_field.dart';
import 'package:news/Cubit/Search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomTextField(
                hintText: "search",
                prefixIcon: Icons.search,
                controller: BlocProvider.of<SearchCubit>(context).controller,

                onTap: () {},
                type: TextInputType.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
