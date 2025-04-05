import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Widgets/category_item.dart';
import 'package:news/Core/Widgets/custom_divider.dart';
import 'package:news/Core/Widgets/custom_error_widget.dart';
import 'package:news/Core/Widgets/custom_text_form_field.dart';
import 'package:news/Cubit/Search_cubit/search_cubit.dart';
import 'package:news/Cubit/Search_cubit/search_state.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                  onChanged: (value) {
                    cubit.fetchSearch(value: value);
                  },
                  hintText: "search",
                  prefixIcon: Icons.search,
                  controller: cubit.controller,
                  onTap: () {},
                  type: TextInputType.text,
                ),
              ),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SuccessSearchState) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),

                      separatorBuilder: (context, index) {
                        return const CustomDivider();
                      },
                      itemCount: state.search.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(items: state.search[index]);
                      },
                    );
                  } else if (state is FailureSearchState) {
                    return CustomErrorWidget(text: state.errMessage);
                  } else {
                    return const Center(child: Text("No Result"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
