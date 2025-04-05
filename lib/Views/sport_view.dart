import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Core/Widgets/category_list_view.dart';
import 'package:news/Core/Widgets/custom_error_widget.dart';
import 'package:news/Cubit/Sports_cubit/sports_cubit.dart';
import 'package:news/Cubit/Sports_cubit/sports_state..dart';

class SportView extends StatelessWidget {
  const SportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsCubit, SportsState>(
      builder: (context, state) {
        if (state is SuccessSportsState) {
          return CategoryListView(itmes: state.sports);
        } else if (state is FailureSportsState) {
          return CustomErrorWidget(text: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator(),);
        } 
      },
    );
  }
}
